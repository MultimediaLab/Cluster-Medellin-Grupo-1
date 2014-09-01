//
//  ViewController.h
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Persona.h"
#import "DivisaViewController.h"

@interface ViewController : UIViewController{
    Persona *persona;
}

@property (strong, nonatomic) IBOutlet UITextField *user;
@property (strong, nonatomic) IBOutlet UITextField *contrasena;

@end
