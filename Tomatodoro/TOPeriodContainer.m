//
//  TOPeriodContainer.m
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 08/05/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import "TOPeriodContainer.h"
#import "TOPeriod.h"

@implementation TOPeriodContainer


// Return JSON string from period Mutable Array

- (NSString *) encodeToJSON
{
    if ([_periods count] > 0) {
        
        NSMutableArray *periodsDictionaries = [[NSMutableArray alloc] init];
        
        // Iterate over the _periods and generate a Dictionary array of periods objects
        
        for (TOPeriod *period in _periods) {
            
            NSDictionary *periodDict = [period periodToDictionary];
            
            [periodsDictionaries addObject:periodDict];
            
        }
        
        // JSON Serialization
        
        NSString *jsonString;
        
        NSError *error = nil;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:periodsDictionaries
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
    
    else
        
    {
        return nil;
    }
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

@end
