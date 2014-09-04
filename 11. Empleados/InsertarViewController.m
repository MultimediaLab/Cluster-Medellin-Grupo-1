//
//  InsertarViewController.m
//  Empleados
//
//  Created by Profesor on 3/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "InsertarViewController.h"

@interface InsertarViewController ()

@end

@implementation InsertarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    nuevoEmpleado = [[Empleados alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }
}
- (IBAction)saveEmp:(id)sender {
    nuevoEmpleado.empCedula = _empCedulaNew.text;
    nuevoEmpleado.empName = _empNameNew.text;
    nuevoEmpleado.empAge = _empAgeNew.text;
    nuevoEmpleado.empAdress = _empAdressNew.text;
    
    [nuevoEmpleado createEmployedInDataBase];
    
    _statusText.text = nuevoEmpleado.status;
}
@end
