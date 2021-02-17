#ifndef __HIGH_RESOLUTION_STOPWATCH_H__
#define __HIGH_RESOLUTION_STOPWATCH_H__
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>


typedef struct timeval TimeVal;

static TimeVal st, et;

void hdStopwatchStart(void) {
    gettimeofday(&st,NULL);
}

void hdStopwatchStop(void) {
    gettimeofday(&et,NULL);
    int elapsed = ((et.tv_sec - st.tv_sec) * 1000000) + (et.tv_usec - st.tv_usec);
    printf("HDStopwatch::Elapsed time: %d micro seconds\n",elapsed);
}

#endif