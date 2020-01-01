/*
 * Matices.cpp
 *
 *  Created on: 30/12/2019
 *      Author: Carlos
 */

#include "Matrices.h"

void displayMatrix3(VectorArray3 input, int matrixSize)
{
	printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<matrixSize; i++)
	{
		int j;
		for(j = 0; j<matrixSize; j++)
		{
			printf("%3d ", input[i].comp[j]);
			if(j == matrixSize-1)
				printf("\r\n");
		}
	}
}

void displayMatrix100(VectorArray100 input, int matrixSize)
{
	printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<matrixSize; i++)
	{
		int j;
		for(j = 0; j<matrixSize; j++)
		{
			printf("%3d ", input[i].comp[j]);
			if(j == matrixSize-1)
				printf("\r\n");
		}
	}
}

void displaySigMatrix100(VectorSigArray100 input, int matrixSize)
{
	printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<matrixSize; i++)
	{
		int j;
		for(j = 0; j<matrixSize; j++)
		{
			printf("%3d ", input[i].comp[j]);
			if(j == matrixSize-1)
				printf("\r\n");
		}
	}
}


void displayMatrix102(VectorArray102 input, int matrixSize)
{
	printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<matrixSize; i++)
	{
		int j;
		for(j = 0; j<matrixSize; j++)
		{
			printf("%3d ", input[i].comp[j]);
			if(j == matrixSize-1)
				printf("\r\n");
		}
	}
}

void displayIntMat100(int* matrix, int height=100, int width=100)
{
	printf("Printing matrix: \r\n");
	int i;
	for (i = 0; i < height; i++)
	{
		int j;
		for (j = 0; j < width; j++)
		{
			printf("%4d ", *(matrix + i*MSIZE100 + j));
			if (j == width - 1)
				printf("\r\n");
		}
	}
}
