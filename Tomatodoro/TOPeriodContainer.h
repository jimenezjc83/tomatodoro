//
//  TOPeriodContainer.h
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 08/05/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOPeriodContainer : NSObject

@property(nonatomic, getter = getPeriods) NSMutableArray *periods;

//Class Methods

- (NSString *) encodeToJSON;

- (NSArray *) decodeObjectToJSON:(NSString *) jsonString;

- (void) removePeriod:(NSString *) uuid;

//Getters for arrays properties

- (NSMutableArray *)getPeriods;

@end
