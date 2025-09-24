/* omptest.cpp */
#include <iostream>
#include <omp.h>
int main(){
    #pragma omp parallel
    {
        int tid  = omp_get_thread_num();
        int nthr = omp_get_num_threads();
        #pragma omp critical
        std::cout << "Hello OpenMP from thread " << tid
                  << " of " << nthr << std::endl;
    }
    return 0;
}