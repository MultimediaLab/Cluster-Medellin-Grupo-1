//
//  BuscarViewController.m
//  Empleados
//
//  Created by Profesor on 3/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "BuscarViewController.h"

@interface BuscarViewController ()

@end

@implementation BuscarViewController

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
    // Do any additional setup after loading the view.
    empleado = [[Empleados alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buscarButton:(id)sender {
    [empleado searchEmployedInDataBasebyId:_cedulaBuscar.text];
    
    _statusTxt.text = empleado.status;
    
    _empIdTxt.text = empleado.empId;
    _empCedulaTxt.text = empleado.empCedula;
    _empNameTxt.text = empleado.empName;
    _empAgeTxt.text = empleado.empAge;
    _empDireccionTxt.text = empleado.empAdress;
    
    [self.view endEditing:YES];
}
@end
