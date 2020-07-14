#include <stdio.h>
#ifndef OS_WEB
#include <cyle_count.h>
#endif
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
    #elif defined OS_WEB
    printf("Browser dettected\n");
    #endif

    #ifndef OS_WEB
    uint64_t cycles = rdtsc();
    #endif

    char *c = "this is a text!!";
    int number = 10;

    printf("Hello World!!: %s - %d\n", c, number);

    #ifndef OS_WEB
    cycles = rdtsc() - cycles;
    printf("Cycles taken: %010lu\n", cycles);
    #endif
    
    return 0;
}