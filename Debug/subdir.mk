################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CU_SRCS += \
../oddeven.cu 

CU_DEPS += \
./oddeven.d 

OBJS += \
./oddeven.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cu
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	/usr/local/cuda-6.5/bin/nvcc -I/usr/local/cuda-6.5/samples/3_Imaging -I/usr/local/cuda-6.5/samples/common/inc -G -g -O0 -gencode arch=compute_12,code=sm_12  -odir "" -M -o "$(@:%.o=%.d)" "$<"
	/usr/local/cuda-6.5/bin/nvcc -I/usr/local/cuda-6.5/samples/3_Imaging -I/usr/local/cuda-6.5/samples/common/inc -G -g -O0 --compile --relocatable-device-code=false -gencode arch=compute_12,code=compute_12 -gencode arch=compute_12,code=sm_12  -x cu -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


