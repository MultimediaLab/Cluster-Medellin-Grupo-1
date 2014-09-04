//
//  InsertarViewController.h
//  Empleados
//
//  Created by Profesor on 3/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleados.h"

@interface InsertarViewController : UIViewController{
    Empleados * nuevoEmpleado;
}

@property (strong, nonatomic) IBOutlet UITextField *empCedulaNew;
@property (strong, nonatomic) IBOutlet UITextField *empNameNew;
@property (strong, nonatomic) IBOutlet UITextField *empAdressNew;
@property (strong, nonatomic) IBOutlet UITextField *empAgeNew;
@property (strong, nonatomic) IBOutlet UILabel *statusText;

- (IBAction)saveEmp:(id)sender;

@end
