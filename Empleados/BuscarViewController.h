//
//  BuscarViewController.h
//  Empleados
//
//  Created by Profesor on 3/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleados.h"

@interface BuscarViewController : UIViewController
{
    Empleados * empleado;
}

@property (strong, nonatomic) IBOutlet UITextField *cedulaBuscar;

@property (strong, nonatomic) IBOutlet UILabel *empIdTxt;
@property (strong, nonatomic) IBOutlet UILabel *empCedulaTxt;
@property (strong, nonatomic) IBOutlet UILabel *empNameTxt;
@property (strong, nonatomic) IBOutlet UILabel *empDireccionTxt;
@property (strong, nonatomic) IBOutlet UILabel *empAgeTxt;

@property (strong, nonatomic) IBOutlet UILabel *statusTxt;

- (IBAction)buscarButton:(id)sender;
@end
