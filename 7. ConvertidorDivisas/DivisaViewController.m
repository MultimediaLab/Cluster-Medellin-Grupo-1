//
//  DivisaViewController.m
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "DivisaViewController.h"

@interface DivisaViewController ()
{
    Divisa * divisa;
}
@end

@implementation DivisaViewController

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
    _saludoUsuario.text = _usuarioInfo;
    
    divisa = [[Divisa alloc] init];
    
    _DollarSlider.minimumValue = 1900;
    _DollarSlider.maximumValue = 2200;
    _DollarSlider.value = 2000;
    
    _actualDivisa.text = [NSString stringWithFormat: @"%.f",_DollarSlider.value];
    _minDivisa.text = [NSString stringWithFormat: @"%.f",_DollarSlider.minimumValue];
    _maxDivisa.text = [NSString stringWithFormat: @"%.f",_DollarSlider.maximumValue];

    
    
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    _configVC = [segue destinationViewController];
    _configVC.delegate = self;
}

- (IBAction)DollarSiderChange:(id)sender {
    
    
    _actualDivisa.text = [NSString stringWithFormat: @"%f",((UISlider*)sender).value];
   _dollars.text =[divisa convertToDollar:_pesos.text AND:_actualDivisa.text];
    [self.view endEditing:YES];
    
}
- (IBAction)Exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateDataSlide:(float)valueminimum valuemax:(float)valuemax{
    
    self.DollarSlider.minimumValue = valueminimum;
    self.DollarSlider.maximumValue = valuemax;
    self.minDivisa.text = [NSString stringWithFormat:@"%.f",valueminimum];
    self.actualDivisa.text = [NSString stringWithFormat:@"%.f",(valueminimum + valuemax)/2];
    self.maxDivisa.text = [NSString stringWithFormat:@"%.f",valuemax];
    self.dollars.text = self.actualDivisa.text;
}

@end
