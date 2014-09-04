//
//  ViewController.m
//  myPaint
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "Paint.h"

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

- (IBAction)changeShape:(id)sender {
    UISegmentedControl * control = sender;
    
    [(Paint *)self.view setShapeType:[control selectedSegmentIndex]];
}

- (IBAction)changeColor:(id)sender {
    UISegmentedControl * control = sender;
    
    [(Paint *)self.view setColorType:[control selectedSegmentIndex]];
}
@end
