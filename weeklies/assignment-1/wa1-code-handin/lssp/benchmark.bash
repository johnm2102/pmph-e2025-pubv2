module load cuda 
module load futhark 
futhark dataset --i32-bounds=-10:10 -b -g [100000000]i32 > data.in 

futhark c gen-lssp-same.fut && ./gen-lssp-same < data.in > data_same.out
futhark c gen-lssp-sorted.fut && ./gen-lssp-sorted < data.in > data_sorted.out 
futhark c gen-lssp-zeros.fut && ./gen-lssp-zeros < data.in > data_zeros.out 

echo "Benchmarking lssp-same"
echo "C Backend"
futhark bench lssp-same.fut --entry-point=onlybench --backend=c
futhark bench lssp-same.fut --entry-point=onlybench --backend=cuda 
echo "CUDA backend"

echo "Benchmarking lssp-sorted"
echo "C Backend"
futhark bench lssp-sorted.fut --entry-point=onlybench --backend=c
echo "Cuda Backend"
futhark bench lssp-sorted.fut --entry-point=onlybench --backend=cuda 

echo "Benchmark lssp-zeros"
echo "C Backend"
futhark bench lssp-zeros.fut --entry-point=onlybench --backend=c 
echo "Cuda Backend"
futhark bench lssp-zeros.fut --entry-point=onlybench --backend=cuda