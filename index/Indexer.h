#ifndef INDEXER_H
#define INDEXER_H

#include <iosfwd>
#include <map>
#include <unordered_set>
#include <vector>

using namespace std;

struct Doc_Data {
	int doc_occur=0; // Number of occurances of the word in the doc
	double doc_norm_factor=0; // Document normalization factor before sqrt
};

typedef map<int, Doc_Data> doc_map;

struct Idx_Data {
	double idf=0; // Inverse document frequency
	int total_occur=0; // Total occurances in corpus
	doc_map doc_data_map; // Map of per document data with docid as key
};

typedef map<string, Idx_Data> idx_map;

typedef map<int, vector<string> > caption_map;

class Indexer {
public:
    void index(ifstream& content, ostream& outfile);
private:
	void loadStopWords(unordered_set<string>&, string);
	void formatWord(string&);
	void computeTotals(idx_map&, double, caption_map&);
};

#endif
