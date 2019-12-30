/*
 * Sobel.cpp
 *
 */

#include "Sobel.h"

VectorArray3 sobel3x, sobel3y;

void initKernels()
{
	sobel3x[0].comp[0] = 1;
	sobel3x[0].comp[1] = 0;
	sobel3x[0].comp[2] = -1;
	sobel3x[1].comp[0] = 2;
	sobel3x[1].comp[1] = 0;
	sobel3x[1].comp[2] = -2;
	sobel3x[2].comp[0] = 1;
	sobel3x[2].comp[1] = 0;
	sobel3x[2].comp[2] = -1;

	sobel3y[0].comp[0] = -1;
	sobel3y[0].comp[1] = -2;
	sobel3y[0].comp[2] = -1;
	sobel3y[1].comp[0] = 0;
	sobel3y[1].comp[1] = 0;
	sobel3y[1].comp[2] = 0;
	sobel3y[2].comp[0] = 1;
	sobel3y[2].comp[1] = 2;
	sobel3y[2].comp[2] = 1;
}

int convUniDirectionSoft(VectorArray3 kernel, VectorArray3 A, int matrixSize)
{
	int acc = 0;
	int i;
	for(i=0; i<matrixSize; i++)
	{
		int j;
		for(j=0; j<matrixSize; j++)
		{
			acc += kernel[matrixSize-1-i].comp[matrixSize-1-j]*A[i].comp[j];
		}
	}
	return acc;
}

int convSoft(VectorArray3 kernel1, VectorArray3 kernel2, VectorArray3 A, int matrixSize)
{
	double res;
	int x = convUniDirectionSoft(kernel1, A, matrixSize);
	int y = convUniDirectionSoft(kernel2, A, matrixSize);
	res = sqrt(pow(x,2)+pow(y,2));
	return res;
}

//mSource is the image.
void padding100(VectorArray100 mSource, VectorArray102 mDest)
{
	int i;
	for(i = 0; i<MSIZE7; i++)
	{
		int j;
		for(j = 0; j<MSIZE7; j++)
		{
			if(i == 0 || j == 0 || i == MSIZE7 || j == MSIZE7)
			{
				mDest[i].comp[j] = 0;
			}
			else
			{
				mDest[i].comp[j] = mSource[i-1].comp[j-1];
			}
		}
	}

}

void winIxSoft(VectorArray100 mSource, VectorArray100 mDest)
{
	VectorArray102 padded;
	padding100(mSource, padded);

	int i;
	for(i=1; i<MSIZE102-1; i++)
	{
		int j;
		for(j=1; j<MSIZE102-1; j++)
		{
			VectorArray3 mConv;
			int k;
			for(k=-1; k<2; k++)
			{
				int l;
				for(l=-1; l<2; l++)
				{
					mConv[1+k].comp[1+l] = padded[i+k].comp[j+l];

				}

			}

			//displayMatrix3(mConv, MSIZE3);
			mDest[i-1].comp[j-1] = convUniDirectionSoft(sobel3x, mConv, MSIZE3);
			//xil_printf("Convolution result %d, %d is: %d \r\n", i, j, resul);
		}
	}
}

void winIySoft(VectorArray100 mSource, VectorArray100 mDest)
{
	VectorArray102 padded;
	padding100(mSource, padded);

	int i;
	for(i=1; i<MSIZE102-1; i++)
	{
		int j;
		for(j=1; j<MSIZE102-1; j++)
		{
			VectorArray3 mConv;
			int k;
			for(k=-1; k<2; k++)
			{
				int l;
				for(l=-1; l<2; l++)
				{
					mConv[1+k].comp[1+l] = padded[i+k].comp[j+l];

				}

			}

			//displayMatrix3(mConv, MSIZE3);
			mDest[i-1].comp[j-1] = convUniDirectionSoft(sobel3y, mConv, MSIZE3);
			//xil_printf("Convolution result %d, %d is: %d \r\n", i, j, resul);
		}
	}
}


