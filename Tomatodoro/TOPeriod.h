//
//  TOPeriod.h
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 28/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOPeriod : NSObject


@property(nonatomic) NSString *uuid;
@property(nonatomic) NSString *name;
@property(nonatomic) NSString *type;
@property(nonatomic) int duration;

- (instancetype)initEmptyPeriod:(NSString *)name;

@end
