#include "Index_server.h"

#include <cassert>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <pthread.h>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <algorithm>
#include <time.h>
#include <vector> 
#include <cmath>
#include <map>

#include "mongoose.h"

using namespace std;

namespace {
    int handle_request(mg_connection *);
    int get_param(const mg_request_info *, const char *, string&);
    string get_param(const mg_request_info *, const char *);
    string to_json(const vector<Query_hit>&);

    ostream& operator<< (ostream&, const Query_hit&);
}

pthread_mutex_t mutexx;

// Runs the index server on the supplied port number.
void Index_server::run(int port)
{
    // List of options. Last element must be NULL
    ostringstream port_os;
    port_os << port;
    string ps = port_os.str();
    const char *options[] = {"listening_ports",ps.c_str(),0};

    // Prepare callback structure. We have only one callback, the rest are NULL.
    mg_callbacks callbacks;
    memset(&callbacks, 0, sizeof(callbacks));
    callbacks.begin_request = handle_request;

    // Initialize the global mutex lock that effectively makes this server
    // single-threaded.
    pthread_mutex_init(&mutexx, 0);

    // Start the web server
    mg_context *ctx = mg_start(&callbacks, this, options);
    if (!ctx) {
        cerr << "Error starting server." << endl;
        return;
    }

    pthread_exit(0);
}

idx_map Index_server::map;

// Load index data from the file of the given name.
void Index_server::init(ifstream& infile)
{
    string idx;
    while (getline(infile, idx)) {
        stringstream ss(idx);

        string word;
        double idf;
        int total_occur;

        ss >> word;
        ss >> idf;
        ss >> total_occur;

        map[word].idf = idf;
        map[word].total_occur = total_occur;

        while (ss) {
            int doc_id;
            int doc_occur;
            double doc_norm_factor;

            ss >> doc_id;
            ss >> doc_occur;
            ss >> doc_norm_factor;

            map[word].doc_data_map[doc_id].doc_occur = doc_occur;
            map[word].doc_data_map[doc_id].doc_norm_factor = doc_norm_factor;
        }    
    }


    // ofstream outfile("tmp");

    // for (auto it1=map.begin(); it1!=map.end(); it1++) {
    //     outfile << it1->first << " " <<
    //             it1->second.idf << " " <<
    //             it1->second.total_occur << " ";
    //     auto it2 = it1->second.doc_data_map.begin();
    //     for (; it2!=it1->second.doc_data_map.end(); it2++) {
    //         outfile << it2->first << " " <<
    //                 it2->second.doc_occur << " " <<
    //                 it2->second.doc_norm_factor << " ";
    //     }
    //     outfile << "\n";
    // }

    // outfile.close();
}

void Index_server::formatWord(string &word) 
{   
    if (word == "") {
        return;
    }
    if (ispunct(word.back())) {
        // Remove punctuation from back
        word.pop_back();
    }
    if (word == "") {
        return;
    }
    if (ispunct(word.front())) {
        // Remove punctuation from front
        word.erase(word.begin());
    }
    // Make lowercase
    transform(word.begin(), word.end(), word.begin(), ::tolower);
}

struct Hit {
    Hit(string id_, double score_)
        : id(id_), score(score_)
        {}
    string id;
    double score;
};

void genRandomHits(vector<Query_hit>& hits) {
    srand (time(NULL));
    int num_hits = rand() % 50;
    num_hits = 20;
    vector<Hit> temp_vec;
    for (int i=0; i<num_hits; ++i) {
        int doc_id = rand() % 199;
        string doc_id_str = to_string(doc_id);
        
        double score = (rand() % 100) / 100.0;

        Hit hit(doc_id_str, score);
        temp_vec.push_back(hit);
        // cout << doc_id_cstr << " " << score << "\n";
    }
    for (Hit hit : temp_vec) {
        Query_hit new_hit(hit.id.c_str(), hit.score);
        hits.push_back(new_hit);
    }
    cout << endl << endl;
    for (int i=0; i<hits.size(); ++i) {
        cout << hits[i].id << " " << hits[i].score << "\n";    
    }
}

void Index_server::match_docs(query_map &q_map, docs_map &docs, vector<int> &matching_docs)
{
        auto it1=q_map.begin();

        string cur_word= it1->first;

        for(auto it2=map[cur_word].doc_data_map.begin(); it2!=map[cur_word].doc_data_map.end();it2++)
        {
            int doc_id = it2->first;
            if(it1->second == map[cur_word].doc_data_map[doc_id].doc_occur)
            {
                docs[doc_id]=1;
            }
        }

        it1++;

        for(; it1!=q_map.end();it1++)
        {
            cur_word = it1->first;
            for(auto it3 = docs.begin();it3!=docs.end();it3++)
            {
                int doc_id = it3->first;
                if(map[cur_word].doc_data_map.count(doc_id)!=0 && it1->second == map[cur_word].doc_data_map[doc_id].doc_occur)
                {
                    docs[doc_id]++;
                }

            }

        }
        
        for(auto it4=docs.begin();it4!=docs.end();it4++)
        {
            if(q_map.size()==it4->second)
            {
                matching_docs.push_back(it4->first);
            }
        }
        
}

void Index_server::calcWeights(query_map &q_map, vector<int> &matching_docs, vector<Query_hit>& hits, double query_norm)
{
    vector<double> q_weights;
    vector<double> c_weights;
    double q_weight = 0;
    double c_weight = 0;
    string cur_word;
    vector<Hit> temp_vec;

    for (auto it1 = q_map.begin(); it1!=q_map.end(); it1++) {
        cur_word = it1->first;
        q_weight = it1->second * map[cur_word].idf;
        q_weight /= sqrt(query_norm);
        q_weights.push_back(q_weight);
    }

    for (auto it2=matching_docs.begin(); it2 != matching_docs.end(); it2++){
        for (auto it3 = q_map.begin(); it3!=q_map.end(); it3++){
            cur_word = it3->first;
            c_weight = map[cur_word].idf * map[cur_word].doc_data_map[*it2].doc_occur;
            c_weight /= sqrt(map[cur_word].doc_data_map[*it2].doc_norm_factor);
            c_weights.push_back(c_weight);
        }
    }

    for (auto i = q_weights.begin(); i!= q_weights.end(); i++){
        cout << *i << " ";
    }
    cout << endl;
    for (auto j=c_weights.begin(); j!=c_weights.end(); j++){
        cout << *j << " ";
    }
    cout << endl;

    double similarity = 0;
    auto doc_id_it = matching_docs.begin();
    for (int i=0; i<c_weights.size(); i+=q_weights.size()){
        cout<<"i: "<<i<<endl;
        for (int j=0; j<q_weights.size(); j++){
            similarity += (q_weights[j]*c_weights[i+j]);
              cout<<"j: "<<j<<endl;
        }
        string doc_id = to_string(*doc_id_it);
        //Query_hit new_hit(doc_id.c_str(), similarity);
        //hits.push_back(new_hit);

        Hit hit(doc_id, similarity);
        temp_vec.push_back(hit);


        similarity = 0;
        doc_id_it++;
    }

    for (Hit hit : temp_vec) {
        Query_hit new_hit(hit.id.c_str(), hit.score);
        hits.push_back(new_hit);
    }
}

bool compareBySimilarity(const Query_hit &a, const Query_hit &b)
{
    return a.score > b.score;
}

// Search the index for documents matching the query. The results are to be
// placed in the supplied "hits" vector, which is guaranteed to be empty when
// this method is called.
void Index_server::process_query(const string& query, vector<Query_hit>& hits)
{
    cout << "Processing query '" << query << "'" << endl;
    query_map q_map;
    docs_map docs;
    vector<int> matching_docs;


    stringstream ss(query);
    double query_norm = 0;

        while (ss) {
            string word;
            ss >> word;
            // TODO eliminate stop words
            formatWord(word);
            if (word == "") {
                continue;
            }
            if (map.count(word) == 0){
                cout << "shit..." << endl;
                //return;
            }
            if (q_map.count(word) == 0) {
                // Insert word into index map
                q_map[word] = 0;
            }
            //Increase tf for word in query
            q_map[word]++;
            cout<<"Query Word: "<<word<<" "<<q_map[word]<<endl;
            double word_total = map[word].total_occur;
            //Check if way to derive total docs
            double total = 200;
            double calc = log10(total/word_total);
            query_norm += pow(calc,2);
        }
        cout<<query_norm<<endl;
        match_docs(q_map, docs,matching_docs);
        calcWeights(q_map, matching_docs, hits, query_norm);

        sort(hits.begin(), hits.end(), compareBySimilarity);

        for (auto i=hits.begin(); i!=hits.end(); i++){
            cout << "similarity score for doc #" << i->id << ": " << i->score << endl;
        }

}

namespace {
    int handle_request(mg_connection *conn)
    {
        const mg_request_info *request_info = mg_get_request_info(conn);

        if (!strcmp(request_info->request_method, "GET") && request_info->query_string) {
            // Make the processing of each server request mutually exclusive with
            // processing of other requests.

            // Retrieve the request form data here and use it to call search(). Then
            // pass the result of search() to to_json()... then pass the resulting string
            // to mg_printf.
            string query;
            if (get_param(request_info, "q", query) == -1) {
                // If the request doesn't have the "q" field, this is not an index
                // query, so ignore it.
                return 1;
            }

            vector<Query_hit> hits;
            Index_server *server = static_cast<Index_server *>(request_info->user_data);

            pthread_mutex_lock(&mutexx);
            server->process_query(query, hits);
            pthread_mutex_unlock(&mutexx);

            string response_data = to_json(hits);
            int response_size = response_data.length();

            // Send HTTP reply to the client.
            mg_printf(conn,
                      "HTTP/1.1 200 OK\r\n"
                      "Content-Type: application/json\r\n"
                      "Content-Length: %d\r\n"
                      "\r\n"
                      "%s", response_size, response_data.c_str());
        }

        // Returning non-zero tells mongoose that our function has replied to
        // the client, and mongoose should not send client any more data.
        return 1;
    }

    int get_param(const mg_request_info *request_info, const char *name, string& param)
    {
        const char *get_params = request_info->query_string;
        size_t params_size = strlen(get_params);

        // On the off chance that operator new isn't thread-safe.
        pthread_mutex_lock(&mutexx);
        char *param_buf = new char[params_size + 1];
        pthread_mutex_unlock(&mutexx);

        param_buf[params_size] = '\0';
        int param_length = mg_get_var(get_params, params_size, name, param_buf, params_size);
        if (param_length < 0) {
            return param_length;
        }

        // Probably not necessary, just a precaution.
        param = param_buf;
        delete[] param_buf;

        return 0;
    }

    // Converts the supplied query hit list into a JSON string.
    string to_json(const vector<Query_hit>& hits)
    {
        ostringstream os;
        os << "{\"hits\":[";
        vector<Query_hit>::const_iterator viter;
        for (viter = hits.begin(); viter != hits.end(); ++viter) {
            if (viter != hits.begin()) {
                os << ",";
            }

            os << *viter;
        }
        os << "]}";

        return os.str();
    }

    // Outputs the computed information for a query hit in a JSON format.
    ostream& operator<< (ostream& os, const Query_hit& hit)
    {
        os << "{" << "\"id\":\"";
        int id_size = strlen(hit.id);
        for (int i = 0; i < id_size; i++) {
            if (hit.id[i] == '"') {
                os << "\\";
            }
            os << hit.id[i];
        }
        return os << "\"," << "\"score\":" << hit.score << "}";
    }
}
