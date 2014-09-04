//
//  VideoViewController.h
//  Alertas&Video
//
//  Created by Developer Cymetria on 22/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : UIViewController

@property MPMoviePlayerController * reproductor;
@property (strong, nonatomic) IBOutlet UIView *boxVideo;

- (IBAction)volverButton:(id)sender;
@end
