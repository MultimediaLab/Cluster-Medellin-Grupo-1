//
//  Paint.h
//  myPaint
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface Paint : UIView

@property CGPoint firstTouch;
@property CGPoint lastTouch;

@property (nonatomic) CGRect currentRect;
@property CGRect redrawRect;

@property UIColor * currentColor;
@property ShapeType shapeType;
@property ColorType colorType;

@property BOOL useRandom;
@property UIImage * imagen;
@end
