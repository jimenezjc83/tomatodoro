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
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@, Type: %@, Duration: %d, UUID: %@", self.name, self.type, self.duration, self.uuid];
    
    return descriptionString;
}

//Se define este inicializador para crear un nuevo periodo con valores por defecto, recibe un nombre cualquiera
- (instancetype) initEmptyPeriod:(NSString *)name
{
    self = [super init];
    
    if (self) {
        _name=name;
        _type=@"Working";
        _duration=25;
        _uuid=[self generateRandomUUID];
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
