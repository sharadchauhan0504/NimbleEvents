//
//  SwiftCFileForOps.c
//  NimbleEvents
//
//  Created by skdevil on 05/22/2023.
//  Copyright (c) 2023 skdevil. All rights reserved.
//

#include "SwiftCFileForOps.h"
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define MAX_EVENTS 1000

typedef struct {
    char key[256];
    char value[256];
    time_t timestamp;
} Event;

static Event events[MAX_EVENTS];
static int eventCount = 0;

bool addEventToSystemC(const char **keys, const char **values, int count) {
    if (eventCount + count > MAX_EVENTS) {
        return false; // Event limit exceeded, return failure
    }
    
    for (int i = 0; i < count; i++) {
        strcpy(events[eventCount].key, keys[i]);
        strcpy(events[eventCount].value, values[i]);
        events[eventCount].timestamp = time(NULL);
        eventCount++;
    }

    return true;
}

float *getAggregatedAnswerC(const char *key) {
    
    float* aggregatedValues = (float*)malloc(2 * sizeof(float));
    float sum10Secs = 0.0f;
    float sum20Secs = 0.0f;
    
    time_t currentTime = time(NULL);
    
    for (int i = 0; i < eventCount; i++) {
        
        if (strcmp(events[i].key, key) == 0) {
            time_t eventTime = events[i].timestamp;
            time_t timeDiff = currentTime - eventTime;
            
            if (timeDiff < 10) {
                sum10Secs += atoi(events[i].value);
            }
            
            if (timeDiff < 20) {
                sum20Secs += atoi(events[i].value);
            }
        }
    }
    
    aggregatedValues[0] = sum10Secs;
    aggregatedValues[1] = sum20Secs;
    
    return aggregatedValues;
}
