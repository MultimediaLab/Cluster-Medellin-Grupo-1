//
//  ViewController.m
//  Mapas
//
//  Created by Profesor on 5/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "FlagView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _worldView.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
    
    [_worldView setShowsUserLocation:YES];
    
    MapPoint * puntoM = [[MapPoint alloc] init];
    [_worldView addAnnotation:puntoM];
    
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([userLocation coordinate], 500, 500);
    [_worldView setRegion:region animated:YES];

}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{

//    NSLog(@"%@", locations);
    CLLocation * newLocation = [locations lastObject];
    MapPoint * ruta = [[MapPoint alloc] initWithCoordinate:[newLocation coordinate] title:@"Corriendo"];
    [_worldView addAnnotation:ruta];
    

}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    FlagView * flag = [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:self options:nil] objectAtIndex:0];
    
    flag.centerOffset = CGPointMake(flag.frame.size.width/2, -flag.frame.size.height/2);

    return flag;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMap:(id)sender {
    int index = [sender selectedSegmentIndex];
    switch (index) {
        case 0:
            [_worldView setMapType:MKMapTypeStandard];
            break;
        case 1:
            [_worldView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [_worldView setMapType:MKMapTypeHybrid];
            break;
    }
}
@end
