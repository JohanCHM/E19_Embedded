#include "xparameters.h"
#include "xscutimer.h"

//Timer defs
#define TIMER_DEVICE_ID		XPAR_XSCUTIMER_0_DEVICE_ID
#define ONE_SECOND 			325000000

//Matrix size
#define MSIZE 4
#define MSIZE3 3
#define MSIZE5 5

//Matrix 3x3
typedef union {
	signed char comp[MSIZE3];
	signed int vect;
} vectorType3;

typedef vectorType3 VectorArray3[MSIZE3];

//Matrix 5x5
typedef union {
	unsigned char comp[MSIZE5];
	unsigned int vect;
} vectorType5;

typedef vectorType5 VectorArray5[MSIZE5];


void initKernels();
void displayMatrix3(VectorArray3 input);


//Global variables
VectorArray3 aInst3, sobel3x, sobel3y;


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


void setInputMatrices3(VectorArray3 A)
{
	int aVal = 1;
	int i;
	for(i = 0; i<MSIZE3; i++)
	{
		int j;
		for(j = 0; j<MSIZE3; j++)
		{
			A[i].comp[j] = aVal;
			aVal++;
		}
	}
}

void displayMatrix3(VectorArray3 input)
{
	xil_printf("Printing matrix: \r\n");
	int i;
	for(i = 0; i<MSIZE3; i++)
	{
		int j;
		for(j = 0; j<MSIZE3; j++)
		{
			xil_printf("%3d ", input[i].comp[j]);
			if(j == MSIZE3-1)
				xil_printf("\r\n");
		}
	}
}

int convolutionSoft(VectorArray3 kernel, VectorArray3 A)
{
	int acc = 0;
	int i;
	for(i=0; i<MSIZE3; i++)
	{
		int j;
		for(j=0; j<MSIZE3; j++)
		{
			acc += kernel[MSIZE3-1-i].comp[MSIZE3-1-j]*A[i].comp[j];
		}
	}
	return acc;
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

   //------For timing the execution--------
   //XScuTimer_LoadTimer(TimerInstancePtr, ONE_SECOND*4);
   //XScuTimer_Start(TimerInstancePtr);
   //cntValueStart = XScuTimer_GetCounterValue(TimerInstancePtr);
   //***** Function here ******
   //cntValueEnd = XScuTimer_GetCounterValue(TimerInstancePtr);

   //Print the time elapsed in clock ticks
   //xil_printf("Time elapsed (in clock ticks): %d \r\n\n", cntValueStart-cntValueEnd);


   initKernels();
   setInputMatrices3(aInst3);
   displayMatrix3(sobel3x);
   displayMatrix3(aInst3);
   int result = 0;
   result = convolutionSoft(sobel3x, aInst3);
   xil_printf("Convolution result is: %d \r\n", result);

}
