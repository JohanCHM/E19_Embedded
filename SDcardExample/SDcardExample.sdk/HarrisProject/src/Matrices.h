/*
 * Matrices.h
 *
 *  Created on: 30/12/2019
 *      Author: Carlos
 */

#ifndef SRC_MATRICES_H_
#define SRC_MATRICES_H_

//Matrix size
#define MSIZE 4
#define MSIZE3 3
#define MSIZE5 5
#define MSIZE7 7
#define MSIZE100 100
#define MSIZE102 102

#include <stdio.h>


//Matrix 3x3
typedef union {
	signed int comp[MSIZE3];
	signed int vect;
} vectorType3;

typedef vectorType3 VectorArray3[MSIZE3];

//Matrix 5x5
typedef union {
	uint8_t comp[MSIZE5];
	unsigned int vect;
} vectorType5;

typedef vectorType5 VectorArray5[MSIZE5];

//Matrix 7x7
typedef union {
	uint8_t comp[MSIZE7];
	unsigned int vect;
} vectorType7;

typedef vectorType7 VectorArray7[MSIZE7];

typedef union{
	unsigned char comp[MSIZE100];
	unsigned int vect;
} vectorType100;

typedef vectorType100 VectorArray100[MSIZE100];

typedef union{
	uint8_t comp[MSIZE102];
	unsigned int vect;
} vectorType102;

typedef vectorType102 VectorArray102[MSIZE102];

typedef union{
	int comp[MSIZE100];
//	int vect;
} vectorSigType100;

typedef vectorSigType100 VectorSigArray100[MSIZE100];

void displayMatrix3(VectorArray3 input, int matrixSize);
void displayMatrix100(VectorArray100 input, int matrixSize);
void displaySigMatrix100(VectorSigArray100 input, int matrixSize);
void displayMatrix102(VectorArray102 input, int matrixSize);

void displayIntMat100(int matrix[100][100], int height, int width);

#endif /* SRC_MATRICES_H_ */
