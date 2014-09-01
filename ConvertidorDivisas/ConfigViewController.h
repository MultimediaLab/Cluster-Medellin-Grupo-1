//
//  ConfigViewController.h
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ConfigViewControllerDelegate <NSObject>

@required

- (void)updateDataSlide:(float)valueminimum valuemax:(float)valuemax;

@end

@interface ConfigViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *minimo;
@property (strong, nonatomic) IBOutlet UITextField *maximo;

@property(nonatomic, strong)id<ConfigViewControllerDelegate>delegate;

- (IBAction)save:(id)sender;


@end
