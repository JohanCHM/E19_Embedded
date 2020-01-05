#include "convolution.h"

void convolution(
    k_t k[M_ROWS][M_COLS],
    wdw_t wdw[M_ROWS][M_COLS],
    result_t &res)
{

    res = 0;
    Row: for (int i = 0; i < M_ROWS; i++)
    {
        Col: for (int j = 0; j < M_COLS; j++)
        {
            res += k[M_ROWS - 1 - i][M_COLS - 1 - j] * wdw[i][j];
            // cout << k[M_ROWS - 1 - i][M_COLS - 1 - j]<< " X " << wdw[i][j]<< " = "<< k[M_ROWS - 1 - i][M_COLS - 1 - j] * wdw[i][j]<< " Tot: "<< res<< endl;
        }
    }
    // cout << "Inside: "<< res << endl;
}
