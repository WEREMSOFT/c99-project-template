// This header file overwrite malloc and free to show where memory is being allocated and where is freed.
// This code can be easily modified to overwrite and add debuging capabilities to other standard functions

#ifndef __OVERWRITE_MACROS_H__
    #define __OVERWRITE_MACROS_H__

    #ifdef DEBUG_PRINT
        #define printf(f_, ...) printf("printing: "); printf((f_), ##__VA_ARGS__)
    #endif

    #ifdef DEBUG_MEMORY

        #include <stdio.h>
        #include <stdlib.h>

        void *debug_malloc(size_t size, char *file, int line)
        {
            void *return_value = malloc(size);
            printf("malloc %lu in %p, %s(%d)\n", size, return_value, file, line);
            return return_value;
        }

        void debug_free(void *pointer, char *file, int line)
        {
            printf("free %p, %s(%d)\n", pointer, file, line);
            free(pointer);
        }

        #define malloc(n) debug_malloc(n, __FILE__, __LINE__)
        #define free(p) debug_free(p, __FILE__, __LINE__)

    #endif // The debug define that activates the debug mode
#endif // The header define