#ifndef INDEX_SERVER_H
#define INDEX_SERVER_H

#include <iosfwd>
#include <stdint.h>
#include <string>
#include <vector>
#include <map>

using namespace std;

struct Query_hit {
    Query_hit(const char *id_, double score_)
        : id(id_), score(score_)
        {}

    const char *id;
    double score;
};

struct Doc_Data {
	int doc_occur=0; // Number of occurances of the word in the doc
	double doc_norm_factor=0; // Document normalization factor before sqrt
};

typedef map<int, Doc_Data> doc_map;
typedef map<int, int> docs_map;

struct Idx_Data {
	double idf=0; // Inverse document frequency
	int total_occur=0; // Total occurances in corpus
	doc_map doc_data_map; // Map of per document data with docid as key
};

typedef map<string, Idx_Data> idx_map;


typedef map<string, double > query_map;

class Index_server {
public:
    void run(int port);

    // Methods that students must implement.
    void init(std::ifstream& infile);
    void process_query(const std::string& query, std::vector<Query_hit>& hits);
    void match_docs(query_map &q_map, docs_map &docs, vector<int> &matching_docs);
    void calcWeights(query_map &q_map, vector<int> &matching_docs, vector<Query_hit>& hits, double query_norm);
private:
	static idx_map map;
	void formatWord(string&);
};

#endif
