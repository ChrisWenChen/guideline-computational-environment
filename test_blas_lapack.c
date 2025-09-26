#include <cblas.h>
#include <lapacke.h>
#include <stdio.h>

int main() {
    /* ----- BLAS: Matrix Multiplication ----- */
    int m = 2, n = 2, k = 2;
    double A[4] = {1.0, 2.0, 3.0, 4.0};   // Matrix A (2x2)
    double B[4] = {5.0, 6.0, 7.0, 8.0};   // Matrix B (2x2)
    double C[4] = {0.0, 0.0, 0.0, 0.0};   // Result C

    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                m, n, k, 1.0, A, k, B, n, 0.0, C, n);

    printf("BLAS: Result of A * B:\n");
    for(int i = 0; i < 4; i++) {
        printf("%f ", C[i]);
        if ((i+1) % n == 0) printf("\n");
    }

    /* ----- LAPACK: Solve Ax = b ----- */
    int N = 2, NRHS = 1, LDA = 2, LDB = 2, INFO;
    int IPIV[2];
    double A2[4] = {3.0, 1.0, 1.0, 2.0}; // Matrix A2
    double b[2] = {9.0, 8.0};            // Vector b

    INFO = LAPACKE_dgesv(LAPACK_ROW_MAJOR, N, NRHS, A2, LDA, IPIV, b, LDB);

    if (INFO == 0) {
        printf("LAPACK: Solution of Ax = b:\n");
        printf("x = [%f, %f]\n", b[0], b[1]);
    } else {
        printf("Error: dgesv failed with INFO = %d\n", INFO);
    }

    return 0;
}