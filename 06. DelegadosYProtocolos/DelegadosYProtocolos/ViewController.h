//
//  ViewController.h
//  DelegadosYProtocolos
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileAccess.h"

@interface ViewController : UIViewController <FileAccessDelegate>

@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) IBOutlet UIImageView *imageUser;
@property (strong, nonatomic) IBOutlet UITextField *urlUser;
@property (strong, nonatomic) IBOutlet UITextField *nameUser;
@property (strong, nonatomic) IBOutlet UILabel *deleteMessage;
- (IBAction)downloadInitButton:(id)sender;
- (IBAction)deleteButton:(id)sender;

@end
