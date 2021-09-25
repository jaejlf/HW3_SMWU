#include <iostream>
#include "findSum.h"

using namespace std;

findSum::findSum(){
	S = NULL;
	num = 0;
}

findSum::findSum(int* s, int n){
	S = NULL;
	num = 0;
	setArray(s, n);
}

findSum::~findSum(){
	if(S)	delete[] S;
	S = NULL;
	num = 0;
}
void findSum::setArray(int *s, int n){
	int i = 0;
	if(S){
		delete[] S;
		S = NULL;
		num = 0;
	}
	S = new int[num = n];
	for(i=0;i<n;i++)	S[i] = s[i];
}
void findSum::showArray(void){
	int i=0;
	for(i=0;i<num;i++){
		cout<<S[i]<<" ";
	}
	cout<<endl;
}

void findSum::sort(int start, int end){    
  if(start >= end){ return; }

  int i = start -1;
  int pivot = S[end];
  int tmp;

  for(int j = start; j < end; j++) {
    if(S[j] <= pivot) {
        tmp = S[++i];
        S[i] = S[j];
        S[j] = tmp;
    }
  }
  tmp = S[i + 1];
  S[i + 1] = S[end];
  S[end] = tmp;
  pivot = i + 1;
  
  sort(start, pivot - 1);
  sort(pivot + 1, end);
}

int findSum::find(int x){

  sort(0, num - 1); //오름차순 정렬
  
  //범위 예외처리
  if(num >= 2){
    if((x > (S[num - 1] + S[num - 2])) || (x < (S[0] + S[1]))) return 0;
  }
  else{
    return 0;
  }

  //Find stopIdx
  int stopIdx = num - 1;
  for(int i = 1; i < num; i++){
    if(S[i] > (x - S[0])){
      stopIdx = i;
      break;
    }
  }

  //Find startIdx
  int startIdx = 0;
  for(int i = 0; i < stopIdx + 1; i++){
    if(S[i] >= (x - S[stopIdx])){
      startIdx = i;
      break;
    }
  }

  //Last find 
  for(int i = startIdx; i < stopIdx; i++){
    for(int j = i + 1; j < stopIdx + 1; j++){
      if((S[i] + S[j]) == x) return 1;
    }
  }

  return 0;
}
