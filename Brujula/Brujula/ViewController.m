//
//  ViewController.m
//  Brujula
//
//  Created by Profesor on 8/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingHeading];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    float posIni = -manager.heading.trueHeading*M_PI/180.0f;
    float posFin = -newHeading.trueHeading*M_PI/180.0f;
    
    NSLog(@"Ini: %.02f - Fin: %.02f", posIni, posFin);
    
    CABasicAnimation * rotacion;
    
    rotacion = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotacion.fromValue = [NSNumber numberWithFloat:posIni];
    rotacion.toValue = [NSNumber numberWithFloat:posFin];
    rotacion.duration = 0.5f;
    
    [_compassImage.layer addAnimation:rotacion forKey:@"rotacionAnimate"];
    _compassImage.transform = CGAffineTransformMakeRotation(posFin);
    
    

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
