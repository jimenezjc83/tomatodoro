//
//  TOClock.h
//  Tomatodoro
//
//  Created by Patricio Valarezo on 22/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOPeriod.h"

@interface TOClock : NSObject

// el + es para class methods
+(void) initClock:(TOPeriod *)period;

@end
