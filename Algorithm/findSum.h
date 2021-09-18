#ifndef _FINDSUM_H_
#define _FINDSUM_H_

class findSum{
private:
	int *S;
	int num;

public:
	findSum();
	findSum(int* s, int n);
	~findSum();

	void setArray(int *s, int n);
	void showArray(void);
  void sort(int start, int end);
	int find(int x);
};

#endif

