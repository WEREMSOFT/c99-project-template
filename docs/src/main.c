#include <stdio.h>
#include <stdlib.h>

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

    void *p = malloc(sizeof(float) * 100);
    free(p);

    char *c = "this is a text!!";
    int number = 10;

    printf("Hello World!!: %s - %d\n", c, number);
   
    return 0;
}