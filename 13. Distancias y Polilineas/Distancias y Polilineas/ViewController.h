//
//  ViewController.h
//  Distancias y Polilineas
//
//  Created by Profesor on 8/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapPoint.h"


@interface ViewController : UIViewController <MKMapViewDelegate>
{
    MKPolyline * linea;

}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
