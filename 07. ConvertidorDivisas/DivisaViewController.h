//
//  DivisaViewController.h
//  ConvertidorDivisas
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Divisa.h"
#import "ConfigViewController.h"

@interface DivisaViewController : UIViewController<ConfigViewControllerDelegate>

@property NSString * usuarioInfo;

@property (strong, nonatomic) IBOutlet UILabel *saludoUsuario;
@property (strong, nonatomic) IBOutlet UITextField *pesos;
@property (strong, nonatomic) IBOutlet UISlider *DollarSlider;
- (IBAction)DollarSiderChange:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *dollars;
@property (strong, nonatomic) IBOutlet UILabel *minDivisa;
@property (strong, nonatomic) IBOutlet UILabel *maxDivisa;
@property (strong, nonatomic) IBOutlet UILabel *actualDivisa;


@property(strong, nonatomic) ConfigViewController *configVC;

- (IBAction)Exit:(id)sender;

@end
