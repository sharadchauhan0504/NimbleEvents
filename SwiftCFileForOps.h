//
//  SwiftCFileForOps.h
//  NimbleEvents
//
//  Created by skdevil on 05/22/2023.
//  Copyright (c) 2023 skdevil. All rights reserved.
//

#ifndef SwiftCFileForOps_h
#define SwiftCFileForOps_h

#include <stdio.h>
#include <stdbool.h>

bool addEventToSystemC(const char **keys, const char **values, int count);
float *getAggregatedAnswerC(const char *key);

#endif /* SwiftCFileForOps_h */
