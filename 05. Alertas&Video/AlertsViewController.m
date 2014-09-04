//
//  AlertsViewController.m
//  Alertas&Video
//
//  Created by Developer Cymetria on 22/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "AlertsViewController.h"

@interface AlertsViewController ()

@end

@implementation AlertsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)volverButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)alertSimple:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Esto es una alerta de eror" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles: @"Aceptar", @"Omitir",nil];
    alerta.tag = 1;
    [alerta show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag ==1) {
        switch (buttonIndex) {
            case 0:
                NSLog(@"Touch en cancelar");
                break;
            case 1:
                NSLog(@"Touch en Aceptar");
                break;
            case 2:
                NSLog(@"Touch en Omitir");
                break;
        }
    }else if (alertView.tag==2){
        switch (buttonIndex) {
            case 0:
                NSLog(@"Usuario Cancelo");
                break;
            case 1:
                NSLog(@"Usuario: %@", [alertView textFieldAtIndex:0].text);
                NSLog(@"Contraseña: %@", [alertView textFieldAtIndex:1].text);
                break;
        }
    }
}
- (IBAction)alertFields:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Acceso" message:@"Ingresa tus datos de usuario y contraseña" delegate:self cancelButtonTitle:@"Cerrar" otherButtonTitles:@"Aceptar", nil];
    alerta.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alerta.tag = 2;
    [alerta show];
}

- (IBAction)actionSheetButton:(id)sender {
    UIActionSheet * menu = [[UIActionSheet alloc] initWithTitle:@"Opciones" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Eliminar" otherButtonTitles:@"Aceptar", nil];
    [menu showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

}
@end
