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

/*
 Primer test de pruebas... Comparar 2 cadenas... -.-
 */
- (void) testStrings{

    NSString *string1 = @"Cadena de texto";
    
    GHTestLog(@"Loggeando desde Test Console: %@", string1);
    
    //Probando si la variable string1 es NULL
    GHAssertNotNil(string1, nil);
    
    //Test para verificar si dos cadenas son iguales
    NSString *string2 = @"Cadena de texto";
    //NSString *string2 = @"Otra simple cadena de texto";
    GHAssertEqualObjects(string1, string2, @"Error: la cadena 1 debería ser igual a: %@", string2);
    
}

/*
    Test para creación de periodos
 
    En este método se van a ejecutar los siguientes tests:
 
    1.   Crear un nuevo periodo
    2.   Validar nombre del periodo
    3.   Validar duración del periodo
    4.   Validar el tipo de periodo
    5.   Crear una colección de periodos y verificar colisiones de UUIDs
 
 */

- (void) testCrudPeriodo
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
    
    //5. Crear una colección de periodos y almacenarlos en un array contenedor
    
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

/*
    Crear un periodo y un nuevo UUID para saber si estos colisionan
 */

- (void) testCrearUUID
{
    
    //1. Crear periodo vacío

    GHTestLog(@"Generate empty period...");
    
    TOPeriod *p = [[TOPeriod alloc] initEmptyPeriod:@"Pomodoro"];
    
    GHTestLog(@"Period: %@", p);
    
    //2. Generar un nuevo UUID
    
    NSString *newUUID = [[NSUUID UUID] UUIDString];
    
    GHTestLog(@"UUID Generado: %@", newUUID);
    
    //3. Verificar que los UUID son diferentes
    
    GHAssertNotEqualStrings(p.periodUuid, newUUID, @"Error: Los UUID han colisionado!!");
    
    
}

/*
    Definir un contenedor de periodos para almacenarlos en algún lugar.
 
    El proceso sería el siguiente:
    1. Definir un arreglo de objetos y generar un conjunto de peridos aleatorios.
    2. Definir un diccionario y agregar el arreglo de objetos generados tomando en cuenta la estructura de la clase Period
    4. Serializar el diccionario y generar el contenedor tipo JSON
    5. Exportar los datos y escribirlos al filesystem
 
 */
- (void) testGenerarJSON
{
    //1. Definir el arreglo de objetos.
    
    //NSMutableArray *jsonArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *dictionaryArray =[[NSMutableArray alloc] init];
    
    //2. Crear un perido de prueba
    
    for (int i=0; i<5; i++) {
        
        //Crear Periodo
        
        TOPeriod *periodTest = [TOPeriod randomPeriod];
        
        //Definir un diccionario y convertir el periodo en diccionario
        
        NSMutableDictionary *periodDictionary = [periodTest periodToDictionary];
        
        GHTestLog(@"dictionary = %@", periodDictionary);
        
        [dictionaryArray addObject:periodDictionary];
        
    }
    
    //Serializar Array a JSON
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionaryArray
                                            options:0 //Puede ser NSJSONWritingPrettyPrinted
                                            error:nil];

    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    GHTestLog(@"jsonString =  %@", jsonString);
    
    
    //Deserializar JSON a Array
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {

        NSDictionary *deserializedDictionary = jsonObject;
        
        GHTestLog(@"deserializedDictionary = %@", deserializedDictionary);
    }
    else if ([jsonObject isKindOfClass:[NSArray class]]) {
        
        NSArray *deserializedArray = jsonObject;
        
        GHTestLog(@"deserializedArray = %@", deserializedArray);
        
    }
    
    
    
    
    
}


@end
