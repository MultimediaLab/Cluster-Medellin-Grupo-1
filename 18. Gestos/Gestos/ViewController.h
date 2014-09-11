//
//  ViewController.h
//  Gestos
//
//  Created by Profesor on 10/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *mico;

@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;


- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender;
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender;

@property AVAudioPlayer * jeje;
@property AVAudioPlayer * mordisco;


@end

