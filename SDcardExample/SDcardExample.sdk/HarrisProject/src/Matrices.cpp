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


void displayMatrix3(VectorFloatArray3 input, int matrixSize)
{
	printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<matrixSize; i++)
	{
		int j;
		for(j = 0; j<matrixSize; j++)
		{
			printf("%3.2f ", input[i].comp[j]);
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


void displayMatrix102(VectorArray102 input, int heightmatrix, int widthMatrix)
{
	printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<heightmatrix; i++)
	{
		int j;
		for(j = 0; j<widthMatrix; j++)
		{
			printf("%3d ", input[i].comp[j]);
			if(j == widthMatrix-1)
				printf("\r\n");
		}
	}
}

void displayMat(int matrix[MSIZE100*MSIZE100],int height, int width)
{
	printf("Printing matrix: \r\n");
	int i;
	for (i = 0; i < height; i++)
	{
		int j;
		for (j = 0; j < width; j++)
		{
			printf("%8d ", *(matrix + i * MSIZE100 + j));
			if (j == width - 1)
				printf("\r\n");
		}
	}
}

void displayMat(int32_t matrix[MSIZE100*MSIZE100],int height, int width)
{
	printf("Printing matrix: \r\n");
	int i;
	for (i = 0; i < height; i++)
	{
		int j;
		for (j = 0; j < width; j++)
		{
			printf("%8ld ", *(matrix + i * MSIZE100 + j));
			if (j == width - 1)
				printf("\r\n");
		}
	}
}

void displayMat(float matrix[MSIZE100*MSIZE100], int height, int width)
{
	printf("Printing matrix: \r\n");
	int i;
	for (i = 0; i < height; i++)
	{
		int j;
		for (j = 0; j < width; j++)
		{
			printf("%8.2f ", *(matrix + i * MSIZE100+ j));
			if (j == width - 1)
				printf("\r\n");
		}
	}
}


void displayMat(double matrix[MSIZE100*MSIZE100],int height, int width)
{
	printf("Printing matrix: \r\n");
	int i;
	for (i = 0; i < height; i++)
	{
		int j;
		for (j = 0; j < width; j++)
		{
			printf("%8.2f ", *(matrix + i * MSIZE100 + j));
			if (j == width - 1)
				printf("\r\n");
		}
	}
}

void displayMat(long double matrix[MSIZE100*MSIZE100], int height, int width)
{
	printf("Printing matrix: \r\n");
	int i;
	for (i = 0; i < height; i++)
	{
		int j;
		for (j = 0; j < width; j++)
		{
			printf("%Lf ", *(matrix + i * MSIZE100 + j));
			if (j == width - 1)
				printf("\r\n");
		}
	}
}
