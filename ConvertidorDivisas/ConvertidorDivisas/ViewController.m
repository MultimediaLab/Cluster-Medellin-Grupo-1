//
//  ViewController.m
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    persona = [[Persona alloc] init];
    
    persona.userModel = @"admin";
    persona.contrasenaModel = @"1234";
    
    
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    
    if(![persona autentication:_user.text andPassword:_contrasena.text ])
    {
        UIAlertView * alerta = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Error de autenticacion de usuario" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        [alerta show];
        return NO;
    }
    else{
        return YES;
        
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DivisaViewController * div = [segue destinationViewController];
    div.usuarioInfo = _user.text;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
