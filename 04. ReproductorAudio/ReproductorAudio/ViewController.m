//
//  ViewController.m
//  ReproductorAudio
//
//  Created by Developer Cymetria on 20/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAudio:@"audio" andCover:@"sound.jpg"];

}
-(void)initAudio:(NSString*)nameAudio andCover:(NSString*)imageCover{
    NSError * error;
    NSString * ruta = [[NSBundle mainBundle] pathForResource:nameAudio ofType:@"mp3"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    _reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    _reproductor.volume = 1;
    _reproductor.pan= 0.5;
    _reproductor.rate= 1;
    _reproductor.enableRate= YES;
    _reproductor.numberOfLoops=-1;
    _reproductor.delegate = self;
    
    [_reproductor prepareToPlay];
    
    _imageCover.image = [UIImage imageNamed:imageCover];
}
-(void)updateBarra{
    _progressBar.progress = _reproductor.currentTime/_reproductor.duration;
    _timerLabel.text = [self changeFormatAudio:_reproductor.currentTime];
}
-(NSString*)changeFormatAudio:(float)value{
    int segundos = (int)value % 60;
    int minutos = (int)(value/60) %60;
    int horas = (int) value/3600;
    return [NSString stringWithFormat:@"%i:%02i:%02i", horas, minutos, segundos];
}

- (IBAction)playButton:(id)sender {
    [_reproductor play];
    sliderTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateBarra) userInfo:nil repeats:YES];
}

- (IBAction)pauseButton:(id)sender {
    //_timerLabel.text = [NSString stringWithFormat:@"%.02f", _reproductor.currentTime];
    [_reproductor pause];
}

- (IBAction)stopButton:(id)sender {
    [_reproductor stop];
    _reproductor.currentTime = 0;
    [sliderTimer invalidate];
    _progressBar.progress = 0;
}

- (IBAction)swithButton:(id)sender {
    UISwitch * valorSwitch = sender;
    if (valorSwitch.on) {
        _containerOptions.hidden= NO;
    }else{
        _containerOptions.hidden=YES;
    }
}

- (IBAction)changeVolume:(id)sender {
    UISlider * vol = sender;
    _reproductor.volume = vol.value;
}

- (IBAction)changeRate:(id)sender {
    _reproductor.rate= ((UISlider *)sender).value;
}

- (IBAction)nextSong:(id)sender {
    [self initAudio:@"Unfucknbelievable" andCover:@"Homer-Simpsons-Music-Headphones-Anime.jpg"];
    [_reproductor play];
}

- (IBAction)prevSong:(id)sender {
    [self initAudio:@"audio" andCover:@"sound.jpg"];
    [_reproductor play];
}
@end
