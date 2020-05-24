#include <stdio.h>
#include <cyle_count.h>

int sum(int x, int y){
    return x + y;
}

int main(void){
    #ifdef OS_Windows_NT
    printf("Windows dettected\n");
    #elif defined OS_Linux
    printf("LINUS dettected\n");
    #elif defined OS_Darwin
    printf("MacOS dettected\n");
    #endif

    uint64_t cycles = rdtsc();
    printf("Hello World!!\n");

    cycles = rdtsc() - cycles;
    printf("Cycles taken: %010lu\n", cycles);

    return 0;
}