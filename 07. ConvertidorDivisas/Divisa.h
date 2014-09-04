//
//  Divisa.h
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Divisa : NSObject

@property float minValue;
@property float maxValue;

-(NSString*)convertToDollar:(NSString*)pesos AND:(NSString*) cambio;

-(BOOL) valuesOK;
@end
