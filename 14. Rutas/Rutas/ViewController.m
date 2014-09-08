//
//  ViewController.m
//  Rutas
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
	_activity.hidden = YES;
    _mapView.delegate = self;
    [_mapView setShowsUserLocation:YES];
}

- (IBAction)handleRoute:(id)sender {
    _activity.hidden=NO;
    [_activity startAnimating];
    _routeButton.enabled= NO;
    
    MKDirectionsRequest * direction = [MKDirectionsRequest new];
    //Punto Inicial de la Ruta - Punto Actual
    MKMapItem * source = [MKMapItem mapItemForCurrentLocation];
    [direction setSource:source];
    //Punto Final
    CLLocationCoordinate2D destinationCoords = CLLocationCoordinate2DMake(38.897676, -77.03653);
    MKPlacemark * destinationPlace = [[MKPlacemark alloc] initWithCoordinate:destinationCoords addressDictionary:nil];
    MKMapItem * destinationItem = [[MKMapItem alloc] initWithPlacemark:destinationPlace];
    [direction setDestination:destinationItem];
    MKDirections * directions = [[MKDirections alloc] initWithRequest:direction];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        _activity.hidden= YES;
        [_activity stopAnimating];
        _routeButton.enabled = YES;
        if (error) {
            NSLog(@"Error en obtener ruta %@", error.description);
            return;
        }
        currentRoute = [response.routes firstObject];
        [self adicionarLinea: currentRoute];
    }];
}
-(void)adicionarLinea: (MKRoute*)route{
    if (routeOverlay) { [_mapView removeOverlay:routeOverlay]; }
    routeOverlay = route.polyline;
    [_mapView addOverlay:routeOverlay];
}
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    
    MKPolylineRenderer * rutaRender = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    rutaRender.strokeColor = [UIColor blueColor];
    rutaRender.lineWidth = 1;
    return rutaRender;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
