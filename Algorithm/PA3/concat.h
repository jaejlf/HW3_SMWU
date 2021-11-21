#ifndef __CONCAT_H__
#define __CONCAT_H__

#include "pri.h"

class concat{
private:
	int num;
	pri **pa;
	pri **sorted;

public:
	concat(void);
	concat(int* priority, char **words, int n);
	~concat(void);

	char* concatenate(void);
  	void merge_sort(int start, int end);
	void merge(int start, int mid, int end);
};

#endif