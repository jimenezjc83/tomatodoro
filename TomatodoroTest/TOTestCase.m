//
//  TOTestCase.m
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 22/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "TOPeriod.h"


@interface TOTestCase : GHTestCase {

}
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
    Test para gestionar los periodos
 
    En este método se van a ejecutar los siguientes tests:
 
    1.   Crear un nuevo periodo
    2.   Validar nombre del periodo
    3.   Validar duración del periodo
    4.   Validar el tipo de periodo
    5.   Crear una colección de periodos y verificar colisiones de UUIDs
 
 */

- (void)testCrudPeriodo
{
    
    //1. Crear un nuevo periodo
    
    GHTestLog(@"Generate empty period...");
    
    TOPeriod *period = [[TOPeriod alloc]initEmptyPeriod:@"Pomodoro"];
    
    GHAssertNotNil(period, @"Error creando periodo!");
    
    GHTestLog(@"Period: %@", period);
    
    //2. Validar nombre del periodo
    
    
    
    
    
}

 

@end
