#include "grid.h"

unsigned long long grid::numOfWays(void){
	result = 0;
	dotNum = (n + 1) * (n + 1);
	targetDot = (n + 1) * (n + 1) - 1;

	initBesideDots();
	initStatus();
	findAllPath(0);

	return result;
}

void grid::initBesideDots(){
	beside = new int *[dotNum];

	for (int i = 0; i < dotNum; i++){
		beside[i] = new int[4];

		beside[i][TOP] = i - (n + 1);
		beside[i][DOWN] = i + (n + 1);
		beside[i][LEFT] = i - 1;
		beside[i][RIGHT] = i + 1;

		if (beside[i][TOP] < 0)	{ beside[i][TOP] = NOTHING; }
		if (beside[i][DOWN] >= dotNum) { beside[i][DOWN] = NOTHING; }
		if (i % (n + 1) == 0) { beside[i][LEFT] = NOTHING; }
		if (beside[i][RIGHT] % (n + 1) == 0) { beside[i][RIGHT] = NOTHING; }
	}
}

void grid::initStatus(){
	status = new int[dotNum];
	memset(status, NOT_VISITED, dotNum * sizeof(int));
	status[0] = VISITED;
}

void grid::findAllPath(int current){
	if (current == targetDot){
		result++;
		return;
	}

	for (int i = 0; i < 4; i++) {
		int nextDot = beside[current][i];
		if ((nextDot != NOTHING) && (status[nextDot] == NOT_VISITED)){
			status[nextDot] = VISITED;
			findAllPath(nextDot);
			status[nextDot] = NOT_VISITED;
		}
	}
}
