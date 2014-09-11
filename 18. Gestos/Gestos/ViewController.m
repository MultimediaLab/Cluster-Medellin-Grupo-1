#import "ViewController.h"

@implementation ViewController
-(AVAudioPlayer*)loadAudio:(NSString*)fileName{
    NSURL * url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"wav"];
    NSError * error;
    AVAudioPlayer * player =  [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"Error: %@", error);
    }else {
        [player prepareToPlay];
    }
    return player;
}
-(void)agregarBananas:(UITapGestureRecognizer*)sender{
    [_jeje play];
    UIImage * banana = [UIImage imageNamed:@"object_bananabunch.png"];
    UIImageView * bananaView = [[UIImageView alloc] initWithImage:banana];
    bananaView.center = CGPointMake(100, 100);
    bananaView.userInteractionEnabled = YES;
    [bananaView addGestureRecognizer:_panGesture];
    [bananaView addGestureRecognizer:_pinchGesture];
    [self.view addSubview:bananaView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _jeje = [self loadAudio:@"hehehe1"];
    _mordisco = [self loadAudio:@"chomp"];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agregarBananas:)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, sender.view.center.y + translation.y);
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (sender.view.center.x > _mico.frame.origin.x && sender.view.center.y > _mico.frame.origin.y) {
        [_mordisco play];
        sender.view.hidden = YES;
    }
}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender {
    sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
    sender.scale = 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
