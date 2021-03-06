//
//  ViewController.m
//  iCalendar
//
//  Created by Profesor on 1/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "CalendarioViewController.h"

@interface ViewController ()
@property Model * modelo;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_modelo = [[Model alloc] init];
    _page = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    _page.delegate = self;
    _page.dataSource = _modelo;
    
    CalendarioViewController * enero = [_modelo viewControllerAtIndex:0 storyboard:self.storyboard];
    
    NSArray * arrayVCs = [NSArray arrayWithObject:enero];
    
    [_page setViewControllers:arrayVCs direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:_page];
    [self.view addSubview:_page.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
