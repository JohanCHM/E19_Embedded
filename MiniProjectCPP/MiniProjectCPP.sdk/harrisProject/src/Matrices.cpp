/*
 * Matices.cpp
 *
 *  Created on: 30/12/2019
 *      Author: Carlos
 */

#include "Matrices.h"

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
