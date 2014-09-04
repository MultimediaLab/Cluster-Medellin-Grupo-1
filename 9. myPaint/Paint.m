//
//  Paint.m
//  myPaint
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Paint.h"
#import "UIColor+Random.h"

@implementation Paint

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    switch (_colorType) {
        case kRedColor:
            _currentColor = [UIColor redColor];
            _useRandom = NO;
            break;
        case kYellowColor:
            _currentColor = [UIColor yellowColor];
            _useRandom = NO;
            break;
        case kBlueColor:
            _currentColor = [UIColor blueColor];
            _useRandom = NO;
            break;
        case kGreenColor:
            _currentColor = [UIColor greenColor];
            _useRandom = NO;
            break;
        case kRandomColor:
            _useRandom = YES;
            break;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);

    
    
    //Color de Relleno
    CGContextSetFillColorWithColor(context, _currentColor.CGColor);
    
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape:
        {
            CGFloat horizontalOffSet = _imagen.size.width/2;
            CGFloat verticalOffSet = _imagen.size.height/2;
            
            CGPoint imagenPunto = CGPointMake(_lastTouch.x - horizontalOffSet, _lastTouch.y -verticalOffSet);
            
            [_imagen drawAtPoint:imagenPunto];
        
        }
        break;
    }
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _imagen = [UIImage imageNamed:@"apple.png"];
        _useRandom = NO;
        _currentColor = [UIColor redColor];
    }
    return self;
}
-(CGRect)currentRect{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x-_firstTouch.x, _lastTouch.y-_firstTouch.y);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_useRandom) {
        _currentColor = [UIColor randomColor];
    }
    UITouch * touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    [self setNeedsDisplayInRect:_redrawRect];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
  //  NSLog(@"Last Touch x:%.f, y:%.f",_lastTouch.x, _lastTouch.y);
    [self setNeedsDisplayInRect:_redrawRect];
}
@end
