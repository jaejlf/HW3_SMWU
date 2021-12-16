#include <cstring>
#ifndef __GRID_H__
#define __GIRD_H__
#define TOP 0
#define LEFT 1
#define DOWN 2
#define RIGHT 3
#define NOTHING -1
#define NOT_VISITED 0
#define VISITED 1

class grid{
private:
	int n;
	unsigned long long result;
  int dotNum;
  int targetDot;
  int** beside;
  int* status;

public:
	grid(int n){
		this->n = n;
		this->result = 0;
	}
	unsigned long long numOfWays(void);
  void initBesideDots();
  void initStatus();
  void findAllPath(int current);
};

#endif