/**
 *	@file	merge_cl_test_resluts.c
 *	@brief	merge result-files of cl_test(c language test)
 *	@author	Masashi KITAMURA (tenka@6809.net)
 *	@date	2013-06-02
 */
#include <cassert>
#include <string>
#include <vector>
#include <map>
#include <iostream>
#include <fstream>
#include <sstream>
#include <stdio.h>
#ifdef _WIN32
#include <string.h>
#include <windows.h>
#endif

using namespace std;

/// item(test-name) & brief
class ItemBrief {
public:
	ItemBrief() : number_(-1) {}

	ItemBrief(string const& itm, string const& brf, string const& sbmsg, unsigned n)
		: item_(itm), brief_(brf), submsg_(sbmsg), number_(n)
	{
	}

	string const& item() const { return item_; }
	string const& brief() const { return brief_; }
	string const& submsg() const { return submsg_; }
	int			  number() const { return number_; }

private:
	string	item_;
	string	brief_;
	string	submsg_;
	int		number_;
};

/// c_language_test's result
class Result1 {
public:
	Result1(string const& nm, size_t sz) : name_(nm), result_(sz) {}

	string const& name() const { return name_; }

	string const& resultStr(unsigned n) const {
		assert(n < result_.size());
		return result_[n];
	}

	void setResult(unsigned n, string const& r) {
		assert(n < result_.size());
		result_[n] = r;
	}

private:
	typedef vector<string>	Result;

private:
	string		name_;
	Result		result_;
};


/// item(test-name),brief and result
class ItemResults {
public:
	ItemResults() {
		itemBriefsFixed_ = false;
		itemBriefs_.reserve(500);
		itemBriefs_.push_back( ItemBrief() );
		results_.reserve(100);
	}

	bool appendItemBrief(string const& itm, string const& brf, string const& sbmsg) {
		size_t idx = itemBriefs_.size();
		itemBriefs_.push_back(ItemBrief(itm, brf, sbmsg, idx));
		ItemToNumbers::iterator ite = itemToNumbers_.find( itm );
		if (ite == itemToNumbers_.end()) {
			itemToNumbers_[ itm ] = idx;
			return true;
		}
		return false;
	}

	void fixedItemBrief() { itemBriefsFixed_ = true; }

	void createResult1(string const& name) {
		assert(itemBriefsFixed_);
		results_.push_back( Result1(name, itemBriefs_.size() ) );
	}

	bool appendCurrentResult1(string const& itm, string const& rslt) {
		assert(itemBriefsFixed_);
		ItemToNumbers::iterator ite = itemToNumbers_.find( itm );
		if (ite != itemToNumbers_.end()) {
			int idx = ite->second;
			results_.back().setResult(idx, rslt);
			return true;
		}
		return false;
	}

	size_t 			itemBriefsSize() const {
		return itemBriefs_.size();
	}

	ItemBrief const& itemBrief(size_t n) const {
		assert(n < itemBriefs_.size());
		return itemBriefs_[n];
	}

 #if 0
	string const&	itemStr(size_t n) const {
		assert(n < itemBriefs_.size());
		return itemBriefs_[n].item();
	}

	string const&	briefStr(size_t n) const {
		assert(n < itemBriefs_.size());
		return itemBriefs_[n].brief();
	}

	string const&	submsgStr(size_t n) const {
		assert(n < itemBriefs_.size());
		return itemBriefs_[n].submsg();
	}
 #endif

	size_t 			resultsSize() const {
		return results_.size();
	}

	string const&	resultName(size_t idx) const {
		assert(itemBriefsFixed_);
		assert(idx < results_.size());
		return results_[idx].name();
	}

	string const&	resultStr(size_t n, size_t idx) const {
		assert(itemBriefsFixed_);
		assert(idx < results_.size());
		return results_[idx].resultStr(n);
	}

	string const&	currentResultStr(size_t n) const {
		return results_.back().resultStr(n);
	}

private:
	typedef vector<ItemBrief>	ItemBriefs;
	typedef map<string, int>	ItemToNumbers;
private:
	ItemBriefs			itemBriefs_;
	ItemToNumbers		itemToNumbers_;
	vector<Result1>		results_;
	bool				itemBriefsFixed_;
};

/// read files
class ItemResultsReader {
public:
	ItemResultsReader(ItemResults& rItemResults) : rItemResults_(rItemResults) {}

	bool readItemBriefs(char const* fname) {
		ifstream ifs(fname);
		if (!ifs.is_open()) {
			cerr << "'" << fname << "' cannot be opened." << endl;
			return false;
		}
		string			empstr;
		string			line;
		vector<string>	clms;
		unsigned		lineNo = 0;
		while (getline(ifs, line)) {
			++lineNo;
			if (line.empty())
				continue;
			clms.clear();
			csv_to_vecStr(line, clms);
			if (clms.size() < 2 || clms[0].empty() )
				continue;
			string const& submsg = (clms.size() >= 3) ? clms[2] : empstr;
			if (rItemResults_.appendItemBrief(clms[0], clms[1], submsg) == false) {
				char const* warnErr = (clms[0][0] == '[') ? "warning" : "error";
				cerr << fname << " (" << lineNo << "): " << warnErr << ": already regist '" << clms[0] << "'" << endl;
			}
		}
		rItemResults_.fixedItemBrief();
		return true;
	}

	bool readItemResults(string const& fname) {
		ifstream ifs(fname.c_str());
		if (!ifs.is_open()) {
			cerr << "'" << fname << "' cannot be opened." << endl;
			return false;
		}
		rItemResults_.createResult1(fname);
		string			line;
		vector<string>	clms;
		unsigned		lineNo = 0;
		while (getline(ifs, line)) {
			++lineNo;
			if (line.empty())
				continue;
			clms.clear();
			csv_to_vecStr(line, clms);
			if (clms.size() < 2 || clms[0].size() == 0 )
				continue;
		 #if 0
			if (clms[0][0] == '[' && clms[1].size() == 0)
				clms[1] = rItemResults_.currentResultStr(1);
		 #endif
			if (rItemResults_.appendCurrentResult1(clms[0], clms[1]) == false)
				cerr << fname << " (" << lineNo << "): error: not found '" << clms[0] << "'" << endl;
		}
		return true;
	}

private:
	bool csv_to_vecStr(string const& src, vector<string>& dst) {
		dst.clear();
		char const* s = &src[0];
		char const* e = s + src.size();
		char const* b = s;
		while (s < e) {
			if (*s == ',') {
				dst.push_back(str_trim(b, s));
				b = s+1;
			}
			++s;
		}
		if (b < s) {
			dst.push_back(str_trim(b, s));
		}
		return true;
	}

	string str_trim(char const* b, char const* e) {
		while (b < e && isspace(*(unsigned char*)b))
			++b;
		while (b < e-1 && isspace( *(unsigned char*)(e-1) ))
			--e;
		return string(b, e);
	}

private:
	ItemResults&	rItemResults_;
};

enum MdType {
	md_csv,
	md_pukiCsv,
	md_pukiTbl,
	md_html,
};

/// write file
class ItemResultsWriter {
public:
	ItemResultsWriter(ItemResults const& rItemResults)
		: rItemResults_(rItemResults)
		, mode_(md_csv)
		, useTestname_(true)
		, useBrief_(true)
		, pOs_(&cout)
		, sameAsTheLeft_("same as the left")
	{
	}

	bool run() {
		if (outpname_.empty()) {
			outpname_ = "<stdout>";
			pOs_      = &cout;
			return output();
		} else {
			ofs_.open(outpname_.c_str());
			if (ofs_.is_open()) {
				pOs_ = &ofs_;
				return output();
			} else {
				cerr << "'" << outpname_ <<  "' cannot be opened.." << endl;
				return false;
			}
		}
	}

	void setOutputName(char const* fname) { outpname_ = fname; }
	void setMode(MdType mode) { mode_ = mode; }
	void setUseTestname(bool sw) { useTestname_ = sw; }
	void setUseBrief(bool sw) { useBrief_ = sw; }
	void setSrcPageName(char const* name) { srcPageName_ = name; }
	void setSameAsTheLeft(char const* str) { sameAsTheLeft_ = str; }

private:
	ostream& os() { return *pOs_; }

	bool output() {
		try {
			switch (mode_) {
			case md_csv: 		outputCsv();	break;
			case md_pukiCsv:	outputCsv();	break;
			case md_pukiTbl:	outputCsv();	break;
			case md_html:		outputHtml(); 	break;
			default: assert(0);
			}
		} catch (...) {
			cerr << outpname_ << ": output error." << endl;
			return false;
		}
		return true;
	}

	void outputCsv() {
		size_t itemBrifsSize = rItemResults_.itemBriefsSize();
		size_t resultSize    = rItemResults_.resultsSize();
		unsigned n = 0;
		for (size_t y = 1; y < itemBrifsSize; ++y) {
			ItemBrief const& itemBrief = rItemResults_.itemBrief(y);
			string itemStr = itemBrief.item();
			bool   optFlag = 0;
			int    hdrType = itemStr.size() > 0 && itemStr[0] == '[';
			if (y == 1 || (hdrType && itemStr.size() > 1 && itemStr[1] == '='))
				hdrType = 2;
			if (useTestname_) {
				if (mode_ == md_pukiTbl) {
					string briefStr = itemBrief.brief();
					if (hdrType) {
						if (useBrief_ && !briefStr.empty())
							itemStr = "~" + briefStr;
						else
							itemStr = "~" + itemStr;
					} else if (useBrief_) {
						++n;
						char numb[99];
						sprintf(numb,"%d", n);
						if (itemStr.find_last_of('.') != string::npos) {
							itemStr = string("[[") + itemStr;
							itemStr +=  ":" + srcPageName_ + "#a" + numb + "]]";
						} else {
							optFlag = true;
						}
						itemStr += " &br(); "; // "(";
						itemStr += briefStr;
						//itemStr += " )";
					}
				}
				outputCsvClm1( itemStr );
			}
		 #if 1
			if (useBrief_ && mode_ != md_pukiTbl) {
				string briefStr = itemBrief.brief();
				outputCsvClm1( briefStr );
			}
		 #endif
			if (hdrType > 0) {
				for (size_t x = 0; x < resultSize; ++x) {
			 		outputCsvClm1( rItemResults_.resultStr(1, x) );
				}
			} else if (optFlag) {
				string prev;
				for (size_t x = 0; x < resultSize; ++x) {
					string const& s = rItemResults_.resultStr(y, x);
					if (s == prev && s.size() > sameAsTheLeft_.size() && sameAsTheLeft_.size() ) {
			 			outputCsvClm1( sameAsTheLeft_ );
					} else {
				 		outputCsvClm1( s );
						prev = s;
					}
				}
			} else {
				for (size_t x = 0; x < resultSize; ++x) {
			 		outputCsvClm1( rItemResults_.resultStr(y, x) );
				}
			}
			outputCsvEol(hdrType);
		}
	}

	void outputCsvClm1(string const& s) {
		if (mode_ == md_pukiCsv)
			os() << ',' << s;
		else if (mode_ == md_pukiTbl)
			os() << '|' << s;
		else
			os() << s << ',';
	}

	void outputCsvEol(int hdrType) {
		if (mode_ == md_pukiTbl) {
			if (hdrType > 1)
				os() << "|h";
			else
				os() << "|";
		}
		os() << endl;
	}

	void outputHtml() {
		// todo.
	}

private:
	ItemResults const&	rItemResults_;
	string				outpname_;
	string				srcPageName_;
	MdType				mode_;
	bool				useTestname_;
	bool				useBrief_;
	ofstream			ofs_;
	ostream*			pOs_;
	string				sameAsTheLeft_;
};

/// generate pukiwiki's c-language-test-source-page
class GenSrcPage {
public:
	GenSrcPage(ItemResults const& rItemResults)
		: rItemResults_(rItemResults)
	{
	}

	void setOutputName(string const& fname) { outpname_ = fname; }
	void setPageName(char const* name) { pagename_ = name; }

	bool run() {
		try {
			if (outpname_.empty()) {
				return true;
			}
			return output();
		} catch (...) {
			cerr << outpname_ << ": output error." << endl;
		}
		return false;
	}

private:
	bool output() {
		ofstream	ofs(outpname_.c_str());
		if (!ofs.is_open()) {
			cerr << "'" << outpname_ <<  "' cannot be opened..." << endl;
			return false;
		}
		size_t	 l = rItemResults_.itemBriefsSize();
		char	 buf[16*1024];
		unsigned n = 0;
		ofs << "** " << pagename_ << endl;
		ofs << endl;
		for (unsigned i = 0; i < l; ++i) {
			ItemBrief const& itemBrief = rItemResults_.itemBrief(i);
			string const& 	 fname     = itemBrief.item();
			if (fname.empty() || fname[0] == '[')
				continue;

			++n;
			bool   hdrMode   = false;
			size_t l         = fname.size();
			int    extCmode  = (l > 2 && fname[l-2] == '.' && fname[l-1] == 'c') ? 1
							 : (l > 4 && fname[l-4] == '.' && fname[l-3] == 'c'
								      && fname[l-2] == 'p' && fname[l-1] == 'p') ? 3
							 :													   0 ;
			if (extCmode == 0)
				continue;

			ofs << "*** " << "&aname(a" << n << ");  " << fname << endl;
			ofs << endl;

			string brief = itemBrief.brief();
			if (!brief.empty() && brief[0] == '#')
				ofs << "&color(#0){ " << brief << " };" << endl;
			else
				ofs << brief << endl;
			ofs << endl;

			if (extCmode) {
				string hname      = fname;
				hname[l-extCmode] = 'h';
				hdrMode           = conv1(hname, ofs, n, true);
			}
			if (conv1(fname, ofs, n, hdrMode) == false)
				cerr << "'" << fname <<  "' cannot be opened..." << endl;

			string const& submsg = itemBrief.submsg();
			if (!submsg.empty()) {
				ofs << submsg << endl;
				ofs << endl;
			}
		}
		return true;
	}

	bool conv1(string fname, ofstream& ofs, unsigned n, bool hdrMode) {
		bool utf8Flag = (fname.find("utf") != string::npos);
		ifstream	ifs(fname.c_str());
		if (ifs.is_open()) {
			if (hdrMode)
				ofs << "[" << fname << "]" << endl;
			string	 line;
			while (getline(ifs, line)) {
			 #ifdef _WIN32
				if (utf8Flag) {
				 	enum { WBUF_SZ = 4096 };
					wchar_t	wbuf[ WBUF_SZ ];
					memset(wbuf,0,sizeof wbuf);
				 	size_t l = MultiByteToWideChar(CP_UTF8, 0, line.c_str(), line.size() + 1, wbuf, WBUF_SZ);
				 	char    buf[ WBUF_SZ * 2 ];
					memset(buf,0,sizeof wbuf);
				 	WideCharToMultiByte(CP_ACP, 0, wbuf, l, buf, sizeof buf, NULL, 0);
					ofs << " " << buf << endl;
				} else
			 #endif
				{
					ofs << " " << line << endl;
				}
			}
			ofs << endl;
			return true;
		} else {
			return false;
		}
	}

private:
	ItemResults const&	rItemResults_;
	string				outpname_;
	string				pagename_;
};

/// command line application
class App {
public:
	App() : itemResults_(), reader_(itemResults_), writer_(itemResults_), genSrcPage_(itemResults_) {}

	int main(int argc, char* argv[]) {
		if (argc <= 1)
			return usage();

		char const*	first = NULL;
		for (int i = 1; i < argc; ++i) {
			char const* p = argv[i];
			if (*p == '-') {
				if (scanOptStr(p+1) == false)
					return 1;	// error
			} else if (first == NULL) {
				first = p;
			} else {
				appendName(p);
			}
		}

		if (reader_.readItemBriefs(first) == false) {
			return 1;		// error
		}
		for (unsigned i = 0; i < names_.size(); ++i) {
			if (reader_.readItemResults(names_[i]) == false)
				return 1;	// error
		}
		if (writer_.run() == false) {
			return 1;	// error
		}
		if (genSrcPage_.run() == false) {
			return 1;	// error
		}
		return 0;		// ok
	}

private:
	void appendName(char const* p) {
		names_.push_back(p);
	}

	bool scanOptStr(char const* p, bool bResfile=false) {
		string s = p;
		if (s == "csv") {
			writer_.setMode(md_csv);
		} else if (s == "pukicsv") {
			writer_.setMode(md_pukiCsv);
		} else if (s == "pukitbl") {
			writer_.setMode(md_pukiTbl);
		} else if (s == "html") {
			writer_.setMode(md_html);
		} else if (s == "notestname") {
			writer_.setUseTestname(false);
		} else if (s == "nobrief") {
			writer_.setUseBrief(false);
		} else {
			char c = *p;
			++p;
			switch (c) {
			case '?':
				usage();
				return false;

			case 'l':
				if (*p == '\0') {
					cerr << "-l requires a string." << endl;
					return false;
				}
				writer_.setSameAsTheLeft(p);
				break;

			case 'o':
				if (*p == '\0') {
					cerr << "-o requires a output file name." << endl;
					return false;
				}
				writer_.setOutputName(p);
				break;

			case 'r':
				if (bResfile) {
					cerr << "-r requires a response file name." << endl;
					return false;
				}
				if (readResponseFile(p) == false)
					return false;
				break;

			case 's':
				if (*p == '\0') {
					cerr << "-s requires a c-language-test-source-page-name." << endl;
					return false;
				}
				writer_.setSrcPageName(p);
				genSrcPage_.setPageName(p);
				genSrcPage_.setOutputName(string(p) + ".txt");
				break;

			default:
				cerr << "Unkown option '-" << p << "'" << endl;
				return false;
			}
		}
		return true;
	}

	bool readResponseFile(char const* fname) {
		ifstream ifs(fname);
		if (!ifs.is_open()) {
			cerr << "-r : '" << fname << "' cannot be opened." << endl;
			return false;
		}
		string			line;
		string			str;
		istringstream	ss;
		unsigned		lineNo = 0;
		while (getline(ifs, line)) {
			++lineNo;
			if (line.empty())
				continue;
			ss.clear();
			ss.str(line);
			//cout << lineNo << " " << line << endl;
			while (!ss.eof()) {
				ss >> skipws >> str;
				if (str.empty())
					continue;
				if (str[0] == '#')	// # comment
					break;
				if (str[0] == '-') {
					if (scanOptStr(&str[1], true) == 0) {
						cerr << fname << " (" << lineNo << ") : error" << endl;
						return false;
					}
				} else {
					appendName(str.c_str());
				}
			}
		}
		return true;
	}

	int usage() const {
		cerr << "usage merge_cl_test_resluts [-opts] item-brief-file result-file(s) // " __DATE__ " writen by tenk*\n"
			 << "  -?           This help.\n"
			 << "  -csv         Output .csv\n"
			 << "  -pukicsv     Output .csv for p(y)ukiwiki\n"
			 << "  -pukitbl     Output table for p(y)ukiwiki\n"
			// << "  -html        Output .html\n"
			 << "  -notestname  no test-filename column\n"
			 << "  -nobrief     no brief column\n"
			 << "  -l<str>      Replace 'same as the left' to 'str'\n"
			 << "  -s<PageName> Make source page (pukiwiki)\n"
			 << "  -r<FILE>     Names and options is input from 'FILE'.\n"
			 << "  -o<FILE>     Output 'FILE'.\n" << endl;
		return 1;	// error
	}

private:
	vector<string>		names_;
	ItemResults			itemResults_;
	ItemResultsReader	reader_;
	ItemResultsWriter	writer_;
	GenSrcPage			genSrcPage_;
};


/** boot entry
 */
int main(int argc, char* args[]) {
	App app;
	return app.main(argc, args);
}
