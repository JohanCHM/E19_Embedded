#include "xparameters.h"
#include "xscutimer.h"

//Timer defs
#define TIMER_DEVICE_ID		XPAR_XSCUTIMER_0_DEVICE_ID
#define ONE_SECOND 			325000000

//Matrix size
#define MSIZE 4

typedef union {
	unsigned char comp[MSIZE];
	unsigned int vect;
} vectorType;

typedef vectorType VectorArray[MSIZE];

void setInputMatrices(VectorArray A, VectorArray B);
void displayMatrix(VectorArray input);
void multiMatrixSoft(VectorArray A, VectorArray B, VectorArray P);
void multiMatrixHard(VectorArray A, VectorArray B, VectorArray P);

//Global variables
VectorArray pInst, aInst, bInst;

void setInputMatrices(VectorArray A, VectorArray B)
{
	int aVal = 1;
	int i;
	for(i = 0; i<MSIZE; i++)
	{
		int j;
		for(j = 0; j<MSIZE; j++)
		{
			A[i].comp[j] = aVal;
			aVal++;

			B[i].comp[j] = i+1;
		}
	}
}

void displayMatrix(VectorArray input)
{
	xil_printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<MSIZE; i++)
	{
		int j;
		for(j = 0; j<MSIZE; j++)
		{
			xil_printf("%3d ", input[i].comp[j]);
			if(j == MSIZE-1)
				xil_printf("\r\n");
		}
	}
}

void multiMatrixSoft(VectorArray A, VectorArray B, VectorArray P)
{
	int i;
		for(i = 0; i<MSIZE; i++)
		{
			int j;
			for(j = 0; j<MSIZE; j++)
			{
				int temp = 0;

				int k;
				for(k=0; k<MSIZE; k++)
				{

					temp += A[i].comp[k]*B[j].comp[k];
				}

				P[i].comp[j] = temp;
			}
		}
}

//====================================================

int main (void) 
{
   xil_printf("-- Start of the Program --\r\n");

   XScuTimer Timer;
   XScuTimer *TimerInstancePtr = &Timer;
   XScuTimer_Config *ConfigPtr;
   int Status;
   int cntValueStart, cntValueEnd;

   //Initialize timer
   ConfigPtr = XScuTimer_LookupConfig(TIMER_DEVICE_ID);

   Status = XScuTimer_CfgInitialize(TimerInstancePtr, ConfigPtr,
		   ConfigPtr->BaseAddr);
   if (Status != XST_SUCCESS) {
	   return XST_FAILURE;
   }



   setInputMatrices(aInst, bInst);

   displayMatrix(aInst);
   displayMatrix(bInst);
   displayMatrix(pInst);

   xil_printf("Computing software matrix multiplication...\r\n\n");
   XScuTimer_LoadTimer(TimerInstancePtr, ONE_SECOND*4);
   XScuTimer_Start(TimerInstancePtr);
   cntValueStart = XScuTimer_GetCounterValue(TimerInstancePtr);
   multiMatrixSoft(aInst, bInst, pInst);
   cntValueEnd = XScuTimer_GetCounterValue(TimerInstancePtr);

   //Print the time elapsed in clock ticks
   xil_printf("Time elapsed (in clock ticks): %d \r\n\n", cntValueStart-cntValueEnd);

   xil_printf("Resulting matrix: \r\n");
   displayMatrix(pInst);
}
