/*
 * sobel.h
 *
 */

#ifndef SRC_SOBEL_H_
#define SRC_SOBEL_H_

#include "Matrices.h"
#include "math.h"

void initKernels();
void initXKernel(VectorArray3 kernel);
void initYKernel(VectorArray3 kernel);
int convUniDirectionSoft(VectorArray3 kernel, VectorArray3 A, int matrixSize);
int convSoft(VectorArray3 kernel1, VectorArray3 kernel2, VectorArray3 A, int matrixSize);
void padding100(VectorArray100 mSource, VectorArray102 mDest);
void winIxSoft(VectorArray102 padded, VectorArray100 mDest);
void winIySoft(VectorArray100 mSource, VectorArray100 mDest);

#endif /* SRC_SOBEL_H_ */
