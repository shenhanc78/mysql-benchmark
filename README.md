## MySQL Compiler Benchmark
Scripts to build mysqld with a custom clang compiler, additional compiler options and feedback directed optimizations.
Also includes benchmarking using sysbench oltp_* scripts.

## Usage 
1. Download mysql-server-mysql-8.0.21 into mysql-benchmark/
  0. cd mysql-benchmark
  a. git clone git@github.com:mysql/mysql-server.git  
  b. git fetch --all --tags  
  c. git checkout tags/mysql-8.0.21 -b mysql-8.0.21-branch  
2. Patch the cmake files using `lld_build.patch` provided.
3. Install prerequisites: sysbench libssl-dev bison. 
4. make sure master-built clang is in $PATH
5. ./do-config.sh and observe the long configuration time
   Comment out the ${SYM_OPT} and observe the difference

