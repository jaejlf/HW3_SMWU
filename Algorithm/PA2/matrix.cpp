#include "matrix.h"
#define MAX 0x7FFFFFFF

Matrix::Matrix(){
	m = n = 0;
	element = 0;
	return;
}
Matrix::~Matrix(){
	this->clearMatrix();
}

void Matrix::clearMatrix(void){
	int i=0;
	if(element){
		for(i=0;i<m;i++){
			if(element[i]){
				delete[] element[i];
				element[i] = 0;
			}
		}
		delete[] element;
		element = 0;
	}
	m = n = 0;
	return;
}

int** Matrix::getMatrix(void){
	return element;
}

void Matrix::insertElements(int _m, int _n, int **_e)
{
  for(int i = 0; i < _m; i++) 
    rowSort(0, _n-1, _e, i);
  
  for(int i = 0; i < _n; i++)
    columnSort(0, _m-1, _e, i);

  setElement(_m, _n, _e);
}

void Matrix::setElement(int _m, int _n, int **_e)
{
  element  = new int*[_m];
  for(int i = 0; i < _m; i++){
		element[i] = new int[_n];
		for(int j = 0; j < _n; j++) element[i][j] = _e[i][j];
	}
}

void Matrix::rowSort(int start, int end, int **row, int row_index)
{  
  if(start >= end){ return; }

  int i = start - 1;
  int pivot = row[row_index][end];
  int tmp;

  for(int j = start; j < end; j++) {
    if(row[row_index][j] <= pivot) {
        tmp = row[row_index][++i];
        row[row_index][i] = row[row_index][j];
        row[row_index][j] = tmp;
    }
  }
  tmp = row[row_index][i + 1];
  row[row_index][i + 1] = row[row_index][end];
  row[row_index][end] = tmp;
  pivot = i + 1;
  
  rowSort(start, pivot - 1, row, row_index);
  rowSort(pivot + 1, end, row, row_index);
}

void Matrix::columnSort(int start, int end, int **col, int col_index)
{  
  if(start >= end){ return; }

  int i = start - 1;
  int pivot = col[end][col_index];
  int tmp;

  for(int j = start; j < end; j++) {
    if(col[j][col_index] <= pivot) {
        tmp = col[++i][col_index];
        col[i][col_index] = col[j][col_index];
        col[j][col_index] = tmp;
    }
  }
  tmp = col[i + 1][col_index];
  col[i + 1][col_index] = col[end][col_index];
  col[end][col_index] = tmp;
  pivot = i + 1;
  
  columnSort(start, pivot - 1, col, col_index);
  columnSort(pivot + 1, end, col, col_index);
}