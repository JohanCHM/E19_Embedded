#ifndef __CONVOLUTION_H__
#define __CONVOLUTION_H__

#include <cmath>
#include <iostream>
using namespace std;


#define M_ROWS 3
#define M_COLS 3
#define M_SIZE 3

typedef int k_t;
typedef int wdw_t;
typedef int result_t;


// Prototype of top level function for C-synthesis
void convolution(
    k_t k[M_ROWS][M_COLS],
    wdw_t wdw[M_ROWS][M_COLS],
    result_t &res);

#endif // __CONVOLUTION_H__ not defined
