#ifndef __CONCAT_H__
#define __CONCAT_H__

#include "pri.h"

class concat{
private:
	int num;
	pri **pa;

public:
	concat(void);
	concat(int* priority, char **words, int n);
	~concat(void);

	char* concatenate(void);
  //void sort(int start, int end);
};

#endif