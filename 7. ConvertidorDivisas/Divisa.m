//
//  Divisa.m
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Divisa.h"

@implementation Divisa

-(NSString*)convertToDollar:(NSString *)pesos AND:(NSString *)cambio{
    return [NSString stringWithFormat:@"%.02f",[pesos floatValue]/[cambio floatValue]];
}

-(BOOL)valuesOK{
    if (_minValue>_maxValue || _minValue == _maxValue) {
        return NO;
    }else {
        return YES;
    }
}

@end
