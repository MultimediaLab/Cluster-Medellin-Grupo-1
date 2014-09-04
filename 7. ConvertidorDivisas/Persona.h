//
//  Persona.h
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject

@property NSString *userModel;
@property NSString *contrasenaModel;

-(BOOL)autentication:(NSString *)usuario andPassword:(NSString *)password;

@end
