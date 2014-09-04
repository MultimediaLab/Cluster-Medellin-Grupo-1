//
//  AnimacionesViewController.m
//  Animaciones_Picker_Navegador
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "AnimacionesViewController.h"

@interface AnimacionesViewController ()

@end

@implementation AnimacionesViewController

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

- (IBAction)animarSimple:(id)sender {
    if (((UISwitch*)sender).on) {
        [UIView animateWithDuration:1.0 animations:^{
            _view1.frame = CGRectMake(_view1.frame.origin.x, _view1.frame.origin.y, _view1.frame.size.width, 160);
            _view1.alpha = 1.0;
        }];
        
    }else  {
        [UIView animateWithDuration:1.0 animations:^{
            _view1.frame = CGRectMake(_view1.frame.origin.x, _view1.frame.origin.y, _view1.frame.size.width, 0);
            _view1.alpha = 0;
        }];
        
    }
    
}

- (IBAction)animacionCallback:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        _view2.backgroundColor = [UIColor redColor];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 animations:^{
            _view2.alpha = 0;
        }];
    }];
    
}

- (IBAction)animacionOpciones:(id)sender {
    [UIView animateWithDuration:0.4 delay:1 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        _view2.alpha = 0;
    
    } completion:nil];
}

- (IBAction)stopAnimation:(id)sender {
    [_view2.layer removeAllAnimations];
}
@end
