# hiptocu
transfer hip to cuda
```bash
sed -i "s/hipLaunchKernelGGL(\(\w\+\), \(\w\+\), \(\w\+\)[ ]*, 0, 0,/\1<<<\2,\3>>>(/" *.cppsed -i -e "/hip_runtime/d" -e "s/hipblas/cublas/g" -e "s/HIPBLAS/CUBLAS/g" *.cpp *.h sed -i -e "s/HostMalloc/MallocHost/" -e "s/hip/cuda/g" *.cpp *.h这是三条用于在Linux命令行下批量修改文件内容的命令，可以用于将HIP代码转换为CUDA代码。这些命令的具体含义如下：
	```
  将所有 .cpp 文件中的 hipLaunchKernelGGL(kernelName, gridSize, blockSize, 0, 0, 替换为 kernelName<<<gridSize, blockSize>>>(
```bash
sed -i "s/hipLaunchKernelGGL(\(\w\+\), \(\w\+\), \(\w\+\)[ ]*, 0, 0,/\1<<<\2,\3>>>(/" *.cpp
```
这条命令使用 sed 工具，并使用正则表达式匹配 hipLaunchKernelGGL 函数调用，并将其替换为CUDA的函数调用方式。具体来说，正则表达式 s/hipLaunchKernelGGL(\(\w\+\), \(\w\+\), \(\w\+\)[ ]*, 0, 0,/ 用于匹配 hipLaunchKernelGGL 函数调用，其中：
	* \(\w\+\) 表示匹配一个或多个单词字符（字母、数字、下划线），并将其保存为一个捕获组（group）；
	* [ ]* 表示匹配零个或多个空格字符；
	* 0, 0, 表示匹配两个零和一个逗号。

替换部分的字符串 \1<<<\2,\3>>>() 则表示将捕获组中的三个字符串分别插入到 <<< 和 >>> 之间，并添加一个空括号。
	1. 将所有 .cpp 和 .h 文件中的 hip_runtime 字符串所在的行删除，将 hipblas 替换为 cublas，将 HIPBLAS 替换为 CUBLAS：

```bash
sed -i -e "/hip_runtime/d" -e "s/hipblas/cublas/g" -e "s/HIPBLAS/CUBLAS/g" *.cpp *.h这条命令使用 sed 工具，并使用多个编辑命令（-e 参数）：
	* /hip_runtime/d 表示删除所有包含 hip_runtime 字符串的行；
	* s/hipblas/cublas/g 表示将所有 hipblas 字符串替换为 cublas；
	* s/HIPBLAS/CUBLAS/g 表示将所有 HIPBLAS 字符串替换为 CUBLAS。
  ```

注意，这条命令修改的文件包括所有扩展名为 .cpp 和 .h 的文件，且会直接覆盖原文件。
	1. 将所有 .cpp 和 .h 文件中的 HostMalloc 替换为 MallocHost，将 hip 替换为 cuda：

```bash
sed -i -e "s/HostMalloc/MallocHost/" -e "s/hip/cuda/g" *.cpp *.h
```
