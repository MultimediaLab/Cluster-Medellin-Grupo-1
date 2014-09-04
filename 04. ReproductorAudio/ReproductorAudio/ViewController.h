//
//  ViewController.h
//  ReproductorAudio
//
//  Created by Developer Cymetria on 20/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>{
    
    NSTimer * sliderTimer;

}
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) IBOutlet UIView *containerOptions;
@property (strong, nonatomic) IBOutlet UIImageView *imageCover;

- (IBAction)playButton:(id)sender;
- (IBAction)pauseButton:(id)sender;
- (IBAction)stopButton:(id)sender;

- (IBAction)swithButton:(id)sender;

- (IBAction)changeVolume:(id)sender;
- (IBAction)changeRate:(id)sender;

- (IBAction)nextSong:(id)sender;
- (IBAction)prevSong:(id)sender;

@property AVAudioPlayer * reproductor;

@end
