#include <iostream>
#include <cstring>
#include "concat.h"
using namespace std;

concat::concat(void){
	this->num = 0;
	this->pa = 0;
	return;
}

concat::concat(int* priority, char **words, int n){
	int i=0;
	this->num = n;
	this->pa = new pri* [n];
	for(i=0;i<n;i++)	this->pa[i] = new pri(priority[i], words[i]);
	return;
}

concat::~concat(void){
	if(this->pa){
		int i=0, n = this->num;
		for(i=0;i<n;i++)	if(this->pa[i])		delete this->pa[i];
		delete[] this->pa;
	}
	return;
}

char* concat::concatenate(void){
	char *result = 0;
  int mid = num/2;

  //하이픈 변경
  for(int i = 0; i < num; i++){
    if(i < mid){
      pa[i]->word = (char*)"-";
    }
  }
  
  //sorting
  //sort(0, num - 1);
  for (int i = 0; i < num; i++) {
      for (int j = 0; j < num - i - 1; j++) {
          if (pa[j]->pr > pa[j + 1]->pr) {
              pri* tmp = pa[j + 1];
              pa[j + 1] = pa[j];
              pa[j] = tmp;
          }
      }
  }

  //테스트 출력
  for(int i = 0; i < num; i++){
    cout << pa[i]->word << " ";
  }
  cout << endl;

  //result 할당

	return result;
}

/*void concat::sort(int start, int end){    
  if(start >= end){ return; }

  int i = start -1;
  int pivot = pa[end]->pr;
  pri* tmp;

  for(int j = start; j < end; j++) {
    if(pa[j]->pr < pivot) {
        tmp = pa[++i];
        pa[i] = pa[j];
        pa[j] = tmp;
    }
  }
  tmp = pa[i + 1];
  pa[i + 1] = pa[end];
  pa[end] = tmp;
  pivot = i + 1;
  
  sort(start, pivot - 1);
  sort(pivot + 1, end);
}*/
