#include <iostream>
#include <cstring>
#include "concat.h"
using namespace std;
#include <time.h>

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
		for(i=0;i<n;i++) if(this->pa[i]) delete this->pa[i];
		delete[] this->pa;
	}
	return;
}

char* concat::concatenate(void){
  char *result = 0;
  int mid = num/2;
  int len;
  string str_result;

  sorted= new pri*[num];
  for(int i = 0; i < num; i++){
    sorted[i] = new pri(pa[i]->pr, pa[i]->word);
  }
  
  //하이픈 변경
  for(int i = 0; i < num/2; i++){
    strcpy(pa[i]->word, "-");
  }

  //sorting
  merge_sort(0, num - 1);
  
  //문자열 연결
  for(int i = 0; i < num; i++){
    if(i != (num - 1)){
      str_result.append(pa[i]->word).append(" ");
    }
    else{
      str_result.append(pa[i]->word);
    }
  }

  len = str_result.length();
  result = new char[len + 1];
  for(int i = 0; i < len + 1; i++){
    result[i] = str_result[i];
  }

	return result;
}

void concat::merge(int start, int mid, int end){
  int i = start;
  int j = mid + 1;
  int k = start;

  while(i <= mid && j <= end) {
    if(pa[i]->pr <= pa[j]->pr){
      sorted[k]->pr = pa[i]->pr;
      strcpy(sorted[k]->word, pa[i]->word);
      i++;
    }
    else{
      sorted[k]->pr = pa[j]->pr;
      strcpy(sorted[k]->word, pa[j]->word);
      j++;
    }
    k++;
  }

  if(i > mid){
    for(int t = j; t <= end; t++){
      sorted[k]->pr = pa[t]->pr;
      strcpy(sorted[k]->word, pa[t]->word);
      k++;
    }
  }
  else{
    for(int t = i; t <= mid; t++){
      sorted[k]->pr = pa[t]->pr;
      strcpy(sorted[k]->word, pa[t]->word);
      k++;
    }
  }

  for(int t = start; t <= end; t++){
    pa[t]->pr = sorted[t]->pr;
    strcpy(pa[t]->word, sorted[t]->word);
  }
}

void concat::merge_sort(int start, int end){
  if(start < end){
    int mid = (start+end)/2;
    merge_sort(start, mid); // 좌측 정렬
    merge_sort(mid + 1, end); // 우측 정렬
    merge(start, mid, end);
  }
}