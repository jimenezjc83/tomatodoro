//
//  TOTestClock.m
//  Tomatodoro
//
//  Created by Patricio Valarezo on 30/04/14.
//  Copyright (c) 2014 NeblinaSoft. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import <OCMock/OCMock.h>
#import "TOPeriod.h"
#import "TOClock.h"

///@protocol Periodo <NSObject>
///- (void)pNombre:(NSString *)nombre pType:(int)type pDuration:(int)duration;
///@end

@interface TOTestClock : GHTestCase {
    
}
@end

@implementation TOTestClock
/*
 * La idea es hacer un reloj estático, no deben/pueden haber mas de un reloj en el 
 * sistema, entonces, lo que necesitamos es una clase estática. Al reloj se le envía
 * un período y este periodo contiene la información para que el reloj cuente. Al
 * reloj se lo puede iniciar, pausar o cancelar
 */
- (void)testStaticClock{
    // Mockear un Periodo
    // http://ocmock.org/ y ver http://www.mockobjects.com/
    // http://hackazach.net/code/2014/03/03/effective-testing-with-ocmock/
    // http://alexvollmer.com/posts/2010/06/28/making-fun-of-things-with-ocmock/
    //TOPeriod *periodo = [[TOPeriod alloc] init];
    id mock = [OCMockObject mockForClass:TOPeriod.class];
    
    // Ahora que lo hemos inicializado queremos saber si el current time del clock es
    // el mismo que el que se ha especificado en el período
    [[[mock stub] andReturnValue:@25] periodDuration];
    
    // Tarea N.1 como accedo al reloj!? 
    [TOClock initClock:mock];
    
    // con [mock periodDuration] estamos accediendo al accesor osea al getter
    GHAssertEquals([TOClock getCurrentTime], [mock periodDuration], @"el valor de periodo deberia ser 25");
    
    // digamos que pasaron dos segundos, para esto necesitamos que el tiempo del reloj se reste en 2 segundos
    [TOClock updateTime:-2];
    
    GHAssertEquals([TOClock getCurrentTime], 23, @"el valor de periodo deberia ser 23");
    
    // Cuando llegue a cero, se supone que el reloj se debe detener, el reloj debería tener un estado para
    // saber que al llegar a 0 se debe detener
    [TOClock updateTime:-23];
    GHTestLog(@"Clock time: %d", [TOClock getCurrentTime]);
    GHAssertEquals([TOClock getStatus], NO, @"el estatus no es falso");
    

}

@end
