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

@property(nonatomic, getter = getPeriodsDictionaries) NSMutableArray *periodsDictionaries;

//Class Methods

- (NSString *) encodeObjectToJSON:(id) dataCollection;

- (NSArray *) decodeObjectToJSON:(NSString *) jsonString;

//Getters for arrays properties

- (NSMutableArray *)getPeriods;

- (NSMutableArray *)getPeriodsDictionaries;

@end
