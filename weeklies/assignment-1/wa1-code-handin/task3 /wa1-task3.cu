#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <string.h> 
#include <cuda_runtime.h>

#include "helper.cuh" 

#define GPU_RUNS 100 
#define N 753411
#define CPU_RUNS 


void naive_map(float *arr, int n, float *result, int result_size){
    if (result_size < n) {
        if (result_size < n){
            printf("The result is less than n\n");
            assert(0)
        }
        for (int i=0; i < n; i++){
            float x = arr[i];
            float temp = x / (x - 2.3);
            result[i] = temp * temp * temp; 
        }
    }
    __global__ void cuda_map(float* X, float* Y, int n){
        const unsigned
    }
}

