#ifndef __MATRIX_H__
#define __MATRIX_H__

class Matrix{
private:
	int m;
	int n;
	int **element;

public:
	Matrix();
	~Matrix();
	void clearMatrix(void);
	int **getMatrix(void);
	void insertElements(int _m, int _n, int **_e);
  void setElement(int _m, int _n, int **_e);
  void rowSort(int start, int end, int **row, int row_index);
  void columnSort(int start, int end, int **col, int col_index);
};

#endif

