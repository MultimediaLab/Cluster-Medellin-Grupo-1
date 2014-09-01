//
//  AlertsViewController.h
//  Alertas&Video
//
//  Created by Developer Cymetria on 22/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertsViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>
{
    UIAlertView * alerta;

}

- (IBAction)volverButton:(id)sender;

- (IBAction)alertSimple:(id)sender;
- (IBAction)alertFields:(id)sender;
- (IBAction)actionSheetButton:(id)sender;
@end
