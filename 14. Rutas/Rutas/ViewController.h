//
//  ViewController.h
//  Rutas
//
//  Created by Profesor on 8/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    MKPolyline * routeOverlay;
    MKRoute * currentRoute;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIButton *routeButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;

- (IBAction)handleRoute:(id)sender;

@end
