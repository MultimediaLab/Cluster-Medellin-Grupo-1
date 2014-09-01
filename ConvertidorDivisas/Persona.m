//
//  Persona.m
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Persona.h"

@implementation Persona

-(BOOL)autentication:(NSString *)usuario andPassword:(NSString *)password{
    if([_userModel isEqualToString:usuario] && [_contrasenaModel isEqualToString:password]){
        return YES;
    }else{
        return NO;
    }
}

@end
