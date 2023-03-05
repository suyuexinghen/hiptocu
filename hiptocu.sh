sed -i "s/hipLaunchKernelGGL(\(\w\+\), \(\w\+\), \(\w\+\)[ ]*, 0, 0,/\1<<<\2,\3>>>(/" *.cpp
sed -i -e "/hip_runtime/d" -e "s/hipblas/cublas/g" -e "s/HIPBLAS/CUBLAS/g" *.cpp *.h
sed -i -e "s/HostMalloc/MallocHost/" -e "s/hip/cuda/g" *.cpp *.h
#rm -f *.cu
rename cpp cu *.cpp
