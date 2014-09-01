//
//  ViewController.h
//  EdadApp
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userText;
@property (strong, nonatomic) IBOutlet UITextField *userAge;
@property (strong, nonatomic) IBOutlet UILabel *userResult;

- (IBAction)userTouchButtonValidate:(id)sender;
@end
