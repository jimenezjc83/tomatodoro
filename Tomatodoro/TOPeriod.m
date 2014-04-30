//
//  TOPeriod.m
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 28/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import "TOPeriod.h"

@implementation TOPeriod


//Sobrecarga del método description
- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"Name: %@, Type: %u, Duration: %d, UUID: %@", self.periodName, self.periodType, self.periodDuration, self.periodUuid];
    
    return descriptionString;
}

+ (instancetype)randomPeriod
{
    
    NSArray *randomPeriodNameList = @[@"Pomodoro", @"Short Break", @"Long Break"];
    
    NSInteger periodNameIndex = arc4random() % [randomPeriodNameList count];
    
    NSString *randomPeriodName = [NSString stringWithFormat:@"%@", randomPeriodNameList[periodNameIndex]];
    
    int randomPeriodDuration = arc4random() % 60;
    
    NSArray *randomTypeList = @[[NSNumber numberWithInt:0], [NSNumber numberWithInt:1]];
    
    NSInteger periodTypeIndex = arc4random() % [randomTypeList count];
    
    NSNumber *randomPeriodType = randomTypeList[periodTypeIndex];
    
    TOPeriod *newPeriod = [[self alloc] initEmptyPeriod:randomPeriodName];
    
    newPeriod.periodDuration = randomPeriodDuration;
    
    newPeriod.periodType = randomPeriodType.intValue;
    
    return newPeriod;
    
}


//Se define este inicializador para crear un nuevo periodo con valores por defecto, recibe un nombre cualquiera
- (instancetype) initEmptyPeriod:(NSString *)name
{
    self = [super init];
    
    if (self) {
        _periodName=name;
        _periodType=WORKING;
        _periodDuration=25;
        _periodUuid=[self generateRandomUUID];
    }
    return self;
}



- (NSString *)generateRandomUUID
{
    NSString *randomUID = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    return randomUID;
}

@end
