#include "Indexer.h"

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <map>
#include <unordered_set>
#include <vector>
#include <list>
#include <math.h>
#include <algorithm>
#include <iterator>
#include <stdio.h>
#include <ctype.h>
#include <locale>

using namespace std;

void Indexer::computeTotals(idx_map &map, double total_docs, caption_map &captn_map)
{
	for (auto it1=map.begin(); it1!=map.end(); it1++) {
		// Compute IDFs
		double num_docs = it1->second.doc_data_map.size();

		
			

		it1->second.idf = log10(total_docs/num_docs);
		auto it2 = it1->second.doc_data_map.begin();
		for (; it2!=it1->second.doc_data_map.end(); it2++) {
			
				double calc_norm_factor = 0;
				int doc_num = it2->first;
				for(auto it3=captn_map[doc_num].begin(); it3!=captn_map[doc_num].end();it3++){

					double total_word_occur = map[*it3].total_occur;
					double calc = log10(total_docs/total_word_occur);
					calc_norm_factor += pow(calc,2);
					
				}
				it2->second.doc_norm_factor = calc_norm_factor;
				//cout<<it2->second.doc_norm_factor<<endl;
		}
		
		/*for (; it2!=it1->second.doc_data_map.end(); it2++) {
			// Computer doc normalization factor
			int tf = it2->second.doc_occur;
			double idf = it1->second.idf;
			it2->second.doc_norm_factor = pow(tf,2)*pow(idf,2);
		}*/
	}
}

void Indexer::formatWord(string &word) 
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

void Indexer::loadStopWords(unordered_set<string> &stop_words, string stop_word_file)
{
    ifstream stopfile(stop_word_file);
    if (!stopfile.is_open()) {
        cerr << "Error opening file: " << stop_word_file << endl;
        exit(1);
    }

    string stop_word;
    while(getline(stopfile, stop_word)) {
    	stop_words.insert(stop_word);
    }
    // for (auto it=stop_words.begin(); it!=stop_words.end(); it++) {
    // 	cout << *it << "\n";
    // 	++i2;
    // }

    stopfile.close();
}

// Reads content from the supplied input file stream, and transforms the
// content into the actual on-disk inverted index file.
void Indexer::index(ifstream& content, ostream& outfile)
{
	idx_map map;
	caption_map captn_map;
	unordered_set<string> stop_words;

	loadStopWords(stop_words, "english.stop.txt");

	string caption;
	int cur_doc = 1;
	while (getline(content, caption)) {
		stringstream ss(caption);
		while (ss) {
			string word;
			ss >> word;
			// TODO convert all to lowercase
			formatWord(word);
			if (word == "" || stop_words.count(word)) {
				continue;
			}

			if (map.count(word) == 0) {
				// Insert word into index map
				Idx_Data idx_data;
				map[word] = idx_data;
			}
			// Check to see if document data for the current doc
			// has been initialized
			if (map[word].doc_data_map.count(cur_doc) == 0) {
				Doc_Data doc_data;
				map[word].doc_data_map[cur_doc] = doc_data;
				
			}
			
			//Add word to caption map
			captn_map[cur_doc].push_back(word);
			// Update counts
			map[word].total_occur++;
			map[word].doc_data_map[cur_doc].doc_occur++;

		}
		cur_doc++;
	}

	computeTotals(map, cur_doc-1, captn_map);

	// Output to file
	for (auto it1=map.begin(); it1!=map.end(); it1++) {
		outfile << it1->first << " " <<
			 	it1->second.idf << " " <<
			 	it1->second.total_occur << " ";
		auto it2 = it1->second.doc_data_map.begin();
		for (; it2!=it1->second.doc_data_map.end(); it2++) {
			outfile << it2->first << " " <<
					it2->second.doc_occur << " " <<
					it2->second.doc_norm_factor << " ";
		}
		outfile << "\n";
	}
	


	


}