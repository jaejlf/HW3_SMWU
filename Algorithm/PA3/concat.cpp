#include <iostream>
#include <cstring>
#include "concat.h"
using namespace std;
#include <time.h>

concat::concat(void)
{
  this->num = 0;
  this->pa = 0;
  return;
}

concat::concat(int *priority, char **words, int n)
{
  int i = 0;
  this->num = n;
  this->pa = new pri *[n];
  for (i = 0; i < n; i++)
    this->pa[i] = new pri(priority[i], words[i]);
  return;
}

concat::~concat(void)
{
  if (this->pa)
  {
    int i = 0, n = this->num;
    for (i = 0; i < n; i++)
      if (this->pa[i])
        delete this->pa[i];
    delete[] this->pa;
  }
  return;
}

char *concat::concatenate(void)
{
  char *result = 0;
  int mid = num / 2;
  int len, tmp_pr;
  char *tmp_word;
  string str_result;

  //하이픈 변경
  for (int i = 0; i < num / 2; i++)
  {
    strcpy(pa[i]->word, "-");
  }

  //sorting
  for (int i = 0; i < num; i++)
  {
    for (int j = 0; j < num - i - 1; j++)
    {
      if (pa[j]->pr > pa[j + 1]->pr)
      {
        pri *tmp = pa[j + 1];
        pa[j + 1] = pa[j];
        pa[j] = tmp;
      }
    }
  }

  //문자열 연결
  for (int i = 0; i < num; i++)
  {
    if (i != (num - 1))
    {
      str_result.append(pa[i]->word).append(" ");
    }
    else
    {
      str_result.append(pa[i]->word);
    }
  }

  //result 할당
  len = str_result.length();
  result = new char[len + 1];
  for (int i = 0; i < len + 1; i++)
  {
    result[i] = str_result[i];
  }

  return result;
}