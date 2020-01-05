#include <iostream>
#include "convolution.h"

using namespace std;

int main(int argc, char **argv)
{
   k_t in_mat_kernel[M_ROWS][M_COLS] = {
       {-1, 0, 1},
       {-2, 0, 2},
       {-1, 0, -1}};
   wdw_t in_mat_wdw[M_ROWS][M_COLS] = {
       {0, 0, 0},
       {0, 254, 254},
       {0, 254, 254}};
   result_t hw_result, sw_result;

   int err_cnt = 0;

   sw_result = 0;
   // Generate the expected result in software
   for (int i = 0; i < M_ROWS; i++)
   {
      for (int j = 0; j < M_COLS; j++)
      {
         sw_result += in_mat_kernel[M_ROWS - 1 - i][M_COLS - 1 - j] * in_mat_wdw[i][j];
         // cout << in_mat_kernel[M_ROWS - 1 - i][M_COLS - 1 - j]<< " X " << in_mat_wdw[i][j]<< " = "<< in_mat_kernel[M_ROWS - 1 - i][M_COLS - 1 - j] * in_mat_wdw[i][j]<< " Tot: "<< sw_result<< endl;
      }
   }

#ifdef HW_COSIM
   // Run the AutoESL matrix multiply block
   convolution(in_mat_kernel, in_mat_wdw, hw_result);
#endif

   // Print result
   cout << "Result: ";

#ifdef HW_COSIM
   cout << hw_result;
   // Check HW result against SW
   if (hw_result != sw_result)
   {
      err_cnt++;
      cout << "* in SW:" << sw_result << endl;
   }
   else
   {
      cout << endl;
   }
#else
   cout << sw_result << endl;
#endif

#ifdef HW_COSIM
   if (err_cnt)
      cout << "ERROR: " << err_cnt << " mismatches detected!" << endl;
   else
      cout << "Test passed." << endl;
#endif
   return err_cnt;
}
