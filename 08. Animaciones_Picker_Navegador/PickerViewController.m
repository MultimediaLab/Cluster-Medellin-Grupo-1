//
//  PickerViewController.m
//  Animaciones_Picker_Navegador
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()
@property NSArray * paises;

@end

@implementation PickerViewController

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
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"paises" ofType:@"plist"];
    _paises = [[NSArray alloc] initWithContentsOfFile:ruta];
    NSLog(@"%@", _paises);
   
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_paises count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_paises objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Exito!!" message:[_paises objectAtIndex:row] delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [alerta show];

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

@end
