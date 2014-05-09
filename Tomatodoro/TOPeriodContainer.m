//
//  TOPeriodContainer.m
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 08/05/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import "TOPeriodContainer.h"

@implementation TOPeriodContainer


// Serialize an object in JSON format

- (NSString *) encodeObjectToJSON:(id) dataCollection
{
    
    NSString *jsonString;
    
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataCollection
                                            options:0 //Pass NSJSONWritingPrettyPrinted to format JSON Output
                                            error:&error];
    
    if ([jsonData length] > 0 && error == nil)
    {
        
        NSLog(@"Successfully serialized the object into data");
        
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    else if ([jsonData length] == 0 && error ==nil )
    {
        
        NSLog(@"No data was returned after serialization");
        
        jsonString = @"";
        
    }else if (error != nil){
    
        NSLog(@"An error happened = %@", error);
        
        jsonString = nil;
    }
    
    return jsonString;
}

// Deserialize a string in JSON format and returns a dictionary Array

- (NSArray *) decodeObjectToJSON:(NSString *) jsonString
{
    
    //1. Convert jsonString to NSData
    
    NSError *error = nil;
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    //2. Deserialize jsonData
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    
    //3. Cast jsonObject to Array
    
    NSArray *deserializedArray = jsonObject;
    
    //3. Return object based on JSON deserialization
    
    return deserializedArray;
    
}

// Getters for Arrays

- (NSMutableArray *)getPeriods
{
    if (!_periods) {
        _periods = [NSMutableArray new];
    }
    return _periods;
}

- (NSMutableArray *)getPeriodsDictionaries
{
    if (!_periodsDictionaries) {
        _periodsDictionaries = [NSMutableArray new];
    }
    return _periodsDictionaries;
}

@end
