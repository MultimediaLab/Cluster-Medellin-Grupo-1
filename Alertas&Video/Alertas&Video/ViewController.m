//
//  ViewController.m
//  Alertas&Video
//
//  Created by Developer Cymetria on 22/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    VariablesViewController * segundaPantalla = [segue destinationViewController];
    
    segundaPantalla.varText = _nameInput.text;
}

@end
