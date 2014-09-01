//
//  Termometro.m
//  Conversor
//
//  Created by Developer Cymetria on 15/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "Termometro.h"

@implementation Termometro

-(NSString*)convertCtoF:(float)value{
    farenheit = (9*value)/5+32;
    NSLog(@"%f",farenheit);
    return [NSString stringWithFormat:@"%.02f", farenheit];
}

-(NSString*)convertFtoC:(float)value{
    celsius = ((value-32)*5)/9;
    return [NSString stringWithFormat:@"%.02f", celsius];
}

@end
