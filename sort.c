#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

void sort(uint32_t *mass,uint32_t n){
    uint32_t i,j,buffer,tmp;
    __asm__(
        "movl %[n], %%eax\n\t"

        // if(n==0)
        "testl %%eax, %%eax\n\t"
        //return 0
        "je 1f\n\t"
        


        //for(i)

        //int i=0;
        "movl $0, %[i]\n\t"
        "0:\n\t"


                        //for(j)

                        //auto j:mass
                        "movl %[n], %%eax\n\t"
                        "movl %[mass],%%edx\n\t"
                        "leal (%%edx,%%eax,4),%%ecx\n\t"
                        "subl $4, %%ecx\n\t"
                        "xorl %%eax,%%eax\n\t"

                         "2:\n\t"
                            "movl (%%edx), %%eax\n\t"
                            "movl %%eax, %[buffer]\n\t"
                            "addl $4,%%edx\n\t"
                            "movl (%%edx), %%eax\n\t"
                            "movl %%eax, %[tmp]\n\t"
                            //if(mass[j]<mass[j+1])
                            "cmpl %[buffer], %%eax\n\t"
                            "jnb 3f\n\t"
                            "movl %[buffer], %%eax\n\t"
                            "movl %%eax, (%%edx)\n\t"
                            "subl $4,%%edx\n\t"
                            "movl %[tmp], %%eax\n\t"
                            "movl %%eax, (%%edx)\n\t"
                            "addl $4,%%edx\n\t"

                            "3:\n\t"
                            "cmpl %%ecx,%%edx\n\t"
                            "jne 2b\n\t"



            // ++i
            "add $1, %[i]\n\t"
            // i<=n
            "movl %[i], %%eax\n\t"
            "cmpl %[n], %%eax\n\t"
            "jb 0b\n\t"
        "1:\n\t"
            :
            :[n]"m"(n),[mass]"m"(mass),[i]"m"(i),[j]"m"(j),[buffer]"m"(buffer),[tmp]"m"(tmp)
            :"ecx","edx","cc","memory"
    );
}

int main(){
    int n,tmp;
    
    scanf("%d",&n);
    uint32_t *mass=(uint32_t*)malloc(sizeof(uint32_t)*5);
    for(int i=0;i<n;i++){
        scanf("%d",&mass[i]);
    }


    printf("\n\n\n\n");
    sort(mass,n);
    for(int i=0;i<n;i++){
        printf("%d\n",mass[i]);
    }
}