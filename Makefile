FC=gfortran #fortran compiler
FFLAGS=-O3 -Wall -Wextra #optimization (for level 3) flags, compiler warnings and the strictest adherence to the latest standards
SRC=param.f90 kernel.f90 eos.f90 particle_generator.f90 fluiddynamics.f90 main.f90
OBJ=${SRC:.f90=.o} #substitute .f90 with .o


%.o: %.f90 #wildcard rule, creation of *.o depends on *.f90
	$(FC) $(FFLAGS) -o $@ -c $<

sph0.1: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ) 

clean: #cleans all the old compilation files
	@rm -f *.mod *.o sph0.1

# tar = sphmain
# obj = param.o kernel.o eos.o particle_generator.o fluiddynamics.o main.o
# gf = gfortran
# $(tar): $(obj)
# 	$(gf) $^ -o $@
#  #       $(gf) $(obj)  -o $(tar)
# %.o:%.f90
#  	$(gf) -c $<  -o $@

# .PHONY:clean
# clean:
# 	rm -f *.o
# 	rm -f *.mod
# 	rm -f *.exe


# TAR = program_main 
# # 获取文件夹中所有.f90文件列表
# SRCS = $(wildcard *.f90)
# # 替换.f90后缀为.o后缀 得到.o文件列表
# OBJ = $(patsubst %.f90,%.o,$(SRCS))
# FC = ifort  
# # $^ 表示所有依赖文件
# $(TAR): $(OBJ)
#     $(FC) -o $(TAR) $^ 
# # %.o %.f90 %.mod 表示任意文件
# %.o:%.f90 %.mod
#     $(FC) -c %.f90
# %.mod:%.f90
#     $(FC) -c %.f90
# # *.o 表示所有.o文件
# clean:
#     rm -rf *.o *.mod