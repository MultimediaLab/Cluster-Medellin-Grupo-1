//
//  SecondViewController.m
//  Conversor
//
//  Created by Developer Cymetria on 15/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertCtoFButton:(id)sender {
    
    Termometro * temperature = [[Termometro alloc] init];
    _resultUser.text = [NSString stringWithFormat:@" %@ ºF", [temperature convertCtoF:[_userNumber.text floatValue]]];
    
    [self.view endEditing:YES];
    
}

- (IBAction)convertFtoCButton:(id)sender {
    
    Termometro * temperature = [[Termometro alloc] init];
    _resultUser.text = [NSString stringWithFormat:@" %@ ºC", [temperature convertFtoC:[_userNumber.text floatValue]]];
    
    [self.view endEditing:YES];
}
@end
