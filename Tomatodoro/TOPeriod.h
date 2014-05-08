//
//  TOPeriod.h
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 28/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOPeriod : NSObject

//Class Properties

@property(nonatomic) NSString *periodUuid;

@property(nonatomic) NSString *periodName;

@property(nonatomic) enum {
                            WORKING,
                            IDLE
                            } periodType;

@property(nonatomic) int periodDuration;

//Class Methods

+ (instancetype) randomPeriod;

- (instancetype) initEmptyPeriod:(NSString *)name;

- (NSMutableDictionary *) periodToDictionary;

@end
