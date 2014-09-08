//
//  ViewController.m
//  Distancias y Polilineas
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
	// Politecnico : 6.209659,-75.577521
    // Mi Casa: 6.217584,-75.5685735
    // Punto Medio: 6.2135973,-75.5728505
    
    _mapView.delegate = self;
    CLLocation * poli = [[CLLocation alloc] initWithLatitude:6.209659 longitude:-75.577521];
    MapPoint * poliPoint = [[MapPoint alloc] initWithCoordinate:[poli coordinate] title:@"Politecnico"];
    
    CLLocation * casa = [[CLLocation alloc] initWithLatitude:6.217584 longitude:-75.5685735];
    MapPoint * casaPoint = [[MapPoint alloc] initWithCoordinate:[casa coordinate] title:@"Mi casa"];
    
    [_mapView addAnnotations:[NSArray arrayWithObjects:poliPoint, casaPoint, nil]];
    
    //Calcular Distancia
    CLLocationDistance distancia = [poli distanceFromLocation:casa];
    UIAlertView * alerta = [[UIAlertView alloc]initWithTitle:@"Distancia" message:[NSString stringWithFormat:@"La distancia es de : %.02f km", distancia/1000] delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [alerta show];
    
    
    
    //Linea
    MKMapPoint * points = malloc(sizeof(CLLocationCoordinate2D)*2);
    points[0]=MKMapPointForCoordinate([poli coordinate]);
    points[1]=MKMapPointForCoordinate([casa coordinate]);
    linea = [MKPolyline polylineWithPoints:points count:2];
    
    [_mapView addOverlay:linea];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    
    MKPolylineRenderer * rutaRender = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    rutaRender.strokeColor = [UIColor blueColor];
    rutaRender.lineWidth = 1;
    rutaRender.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    return rutaRender;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    MKCoordinateRegion region;
    region.center.latitude =6.2135973;
    region.center.longitude =-75.5728505;
    region.span.latitudeDelta=0.02;
    region.span.longitudeDelta = 0.02;
    [_mapView setRegion:region];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
