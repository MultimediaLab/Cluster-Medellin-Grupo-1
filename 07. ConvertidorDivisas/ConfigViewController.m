//
//  ConfigViewController.m
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ConfigViewController.h"
#import "Divisa.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

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

- (IBAction)save:(id)sender {
    
    Divisa * di = [[Divisa alloc] init];
    di.minValue = [_minimo.text floatValue];
    di.maxValue = [_maximo.text floatValue];
    
    if ([di valuesOK]) {
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.delegate updateDataSlide:[self.minimo.text floatValue] valuemax:[self.maximo.text floatValue]];
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Eror" message:@"Datos incorrectos" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [alert show];

    }

}
@end
