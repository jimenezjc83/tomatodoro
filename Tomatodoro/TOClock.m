//
//  TOClock.m
//  Tomatodoro
//
//  Created by Patricio Valarezo on 22/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import "TOClock.h"


static int timeCount;
static BOOL status;

@implementation TOClock

+(void) initClock:(TOPeriod *)period
{
    timeCount = period.periodDuration;
    status = YES;
    return;
}

+(int) getCurrentTime
{
    return timeCount;
}

+(void) updateTime:(int)time
{
    timeCount += time;
    if (timeCount<=0) status=NO;
}
/*
 * Clock status: running is true, stoped is false
 */
+(BOOL) getStatus
{
    return status;
}

@end
