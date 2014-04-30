//
//  TOTestCase.m
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 22/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "TOClock.h"
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
    
    TOPeriod *p = [[TOPeriod alloc]initEmptyPeriod:@"Pomodoro"];
    
    GHAssertNotNil(p, @"Error creando periodo!");
    
    GHTestLog(@"Period: %@", p);
    
    //2. Validar nombre del periodo
    
    GHAssertEqualStrings(p.periodName, @"Pomodoro", @"El nombre es incorrecto!");
    
    //3. Validar la duracion de un periodo
    
    GHAssertGreaterThan(p.periodDuration, 0, @"El periodo debe ser mayor a 0");
    
    //4. Validar el tipo de periodo
    
    GHAssertEquals(p.periodType, WORKING, @"El tipo de perido es incorrecto");
    
    //5. Crear una colección de periodos y verificar colisiones de UUIDs
    
    NSMutableArray *periods = [[NSMutableArray alloc] init];
    
    for (int i=0; i < 5; i++) {
        TOPeriod *p1 = [TOPeriod randomPeriod];
        [periods addObject:p1];
    }
    
    GHTestLog(@"Periodos Generados: ");
    
    for (TOPeriod *period in periods) {
        GHTestLog(@"%@", period);
    }
    
    
    

}

 

@end
