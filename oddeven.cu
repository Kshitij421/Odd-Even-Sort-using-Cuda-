#include<stdio.h>
#include<cuda.h>



__global__ void oddeven(int* x,int I,int n)
{
	int id=blockIdx.x;
	if(I==0 && ((id*2+1)< n)){
		if(x[id*2]>x[id*2+1]){
			int X=x[id*2];
			x[id*2]=x[id*2+1];
			x[id*2+1]=X;
		}
	}
	if(I==1 && ((id*2+2)< n)){
		if(x[id*2+1]>x[id*2+2]){
			int X=x[id*2+1];
			x[id*2+1]=x[id*2+2];
			x[id*2+2]=X;
		}
	}
}

int main()
{
	int a[100],n,c[100],i;
	int *d;

	printf("Enter how many elements of first array:");
	scanf("%d",&n);
	printf("Enter No.\n");
	for(i=0; i<n; i++)
	{
		scanf("%d",&a[i]);
	}

	cudaMalloc((void**)&d, n*sizeof(int));

	cudaMemcpy(d,a,n*sizeof(int),cudaMemcpyHostToDevice);


	for(i=0;i<n;i++){

		//int size=n/2;

		oddeven<<<n/2,1>>>(d,i%2,n);
	}
	printf("\n");


	cudaMemcpy(c,d,n*sizeof(int), cudaMemcpyDeviceToHost);
	printf("Sorted Array is:\t");
	for(i=0; i<n; i++)
	{
		printf("%d\t",c[i]);
	}

	cudaFree(d);
	return 0;
}

