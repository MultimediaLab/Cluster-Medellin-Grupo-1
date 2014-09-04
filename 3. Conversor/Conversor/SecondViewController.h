//
//  SecondViewController.h
//  Conversor
//
//  Created by Developer Cymetria on 15/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Termometro.h"

@interface SecondViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNumber;
@property (strong, nonatomic) IBOutlet UILabel *resultUser;
- (IBAction)convertCtoFButton:(id)sender;
- (IBAction)convertFtoCButton:(id)sender;

@end
