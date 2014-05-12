//
//  TOTestCase.m
//  Tomatodoro
//
//  Created by Juan Carlos Jiménez on 22/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "TOPeriod.h"
#import "TOPeriodContainer.h"


@interface TOTestCase : GHTestCase
{

    TOPeriodContainer *_container;  //El contenedor de periodos. Se lo va usar en algunos test.
    NSString *_JSONTestString;
    
}

@end

@implementation TOTestCase

// Run before each test method

- (void)setUp
{
    _container = [[TOPeriodContainer alloc] init];  //Inicializar el contenedor de periodos
    _JSONTestString = [[NSString alloc] initWithFormat:@"[{\"name\":\"Long Break\",\"type\":1,\"duration\":29,\"uuid\":\"64AB89F5-BD08-4A0C-9F3C-2685534115DE\"}]"];
    
}

// Run after each test method

- (void)tearDown
{
    _container = nil;   //Destruir el contenedor de periodos
}

/*
    testStrings
 
    Primer test de pruebas... Comparar 2 cadenas... -.-
 
 */

- (void) testStrings
{

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
    testCreatePeriod
 
    Test para creación de periodos
 
    Tareas:
    1. Crear un nuevo periodo
    2. Validar nombre del periodo
    3. Validar duración del periodo
    4. Validar el tipo de periodo
    5. Crear una colección de periodos y verificar colisiones de UUIDs
 
 */

- (void) testCreatePeriod
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
    
    for (int i=0; i < 5; i++) {
        TOPeriod *p1 = [TOPeriod randomPeriod];
        [_container.periods addObject:p1];
    }
    
    GHTestLog(@"Periodos Generados: ");
    
    for (TOPeriod *period in _container.periods) {
        GHTestLog(@"%@", period);
    }

}

/*
    testGenerateUUID
 
    Crear un periodo con un UUID aleatorio y verificar si un nuevo UUID colisiona con el actual
 
 */

- (void) testGenerateUUID
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
    testJSONGenerate
    
    Generar un conjunto de periodos y convertirlos a formato JSON
 
    Tareas:
    1. Generar un conjunto de periodos aleatorios.
    2. Convertir los periodos generados en diccionarios y guardarlos en el contenedor
    3. Serializar el contenedor y generar una cadena de texto en formato JSON
    4. Deserializar la cadena de texto y generar un arreglo de diccionarios que corresponden a los periodos generados
 
 */

- (void) testJSONGenerate
{
    
    //1. Generar un conjunto de periodos aleatorios.
    
    for (int i=0; i<5; i++) {
        
        //Crear Periodo
        
        TOPeriod *periodTest = [TOPeriod randomPeriod];
        
        //2. Agregar periodo al contenedor
        
        [_container.periods addObject:periodTest];
    
    }

    //Serializar el contenedor de periodos a JSON
    
    NSString *jsonString = [_container encodeToJSON];
    
    GHTestLog(@"jsonString =  %@", jsonString);

    //Deserializar una cadena de texto en formato JSON a un Array
    
    NSArray *jsonArray = [_container decodeObjectToJSON:jsonString];
    
    GHTestLog(@"jsonArray =  %@", jsonArray);
        
}

/*
    testManagePeriodContainer
 
    Realizar operaciones sobre el contenedor de periodos:
    
    - Agregar periodos
    - Eliminar periodo(s)
    - Actualizar periodo(s)
 
    Todo esto, obteniendo los datos desde un arreglo tipo JSON definido en el setUp de esta clase.
 
 */

- (void) testManagePeriodContainer
{
 
    // 1. El primer paso es crear el arreglo JSON a partir de la cadena de texto definida en el setUP
    
    NSArray *jsonArray = [_container decodeObjectToJSON:_JSONTestString];
    
    GHAssertNotNil(jsonArray, @"Error al obtener los datos del JSON String");
    
    // 2. Recorrer el array para convertir los diccionarios en instancias de periodos
    
    for (NSDictionary *periodDict in jsonArray) {
        
        TOPeriod *p = [[TOPeriod alloc] initWithDictionary:periodDict];
        
        GHTestLog(@"Creando periodo a partir de json: %@ - Instancia: %@", periodDict, p);
       
        [_container.periods addObject:p];
        
    }
    
    // 3. Agregar un nuevo periodo al contenedor
    
    TOPeriod *newPeriod = [TOPeriod randomPeriod];
    
    [_container.periods addObject:newPeriod];
    
    // 4. Obtener el JSON del nuevo contenedor
    
    NSString *newJSONString = [_container encodeToJSON];
    
    GHAssertNotNil(newJSONString, @"No se obtuvo información del contenedor");
    
    
}

@end
