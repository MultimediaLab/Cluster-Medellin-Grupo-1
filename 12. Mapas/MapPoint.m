//
//  MapPoint.m
//  Mapas
//
//  Created by Profesor on 5/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "MapPoint.h"


@implementation MapPoint 

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString *)titulo{
    self = [super init];
    if (self) {
        _coordinate = coord;
        _title = titulo;
    }
    return self;
}
-(id)init{
    // Medellin esta en Lat: 6,235925 Lon: -75,57513
    return [self initWithCoordinate:CLLocationCoordinate2DMake(6.235925, -75.57513) title:@"Medellin"];
}
@end
