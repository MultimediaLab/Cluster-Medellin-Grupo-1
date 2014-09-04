//
//  VideoViewController.m
//  Alertas&Video
//
//  Created by Developer Cymetria on 22/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    _reproductor = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    _reproductor.view.frame = CGRectMake(0, 0, 280, 170);
    
    [_boxVideo addSubview:_reproductor.view];
    
    [_reproductor play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)volverButton:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
