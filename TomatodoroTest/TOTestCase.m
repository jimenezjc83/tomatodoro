//
//  TOTestCase.m
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 22/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "TOPomodoro.h"


@interface TOTestCase : GHTestCase { }
@end

@implementation TOTestCase

- (void)testStrings{

    NSString *string1 = @"Una cadena balbalalb";
    
    GHTestLog(@"Loggeando desde Test Console: %@", string1);
    
    //Probando si la variable string1 es NULL
    GHAssertNotNil(string1, nil);
    
    //Test para verificar si dos cadenas son iguales
    NSString *string2 = @"Otra simple cadena de texto";
    GHAssertEqualObjects(string1, string2, @"Error: la cadena 1 debería ser igual a: %@", string2);
    
}

/*
 probar que podemos crear un TOPomodoro
 */
- (void)testCreatePomodoro{
    p = [[TOPomodoro alloc] init];
    
}

@end
