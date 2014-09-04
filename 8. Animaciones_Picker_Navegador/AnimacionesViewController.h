//
//  AnimacionesViewController.h
//  Animaciones_Picker_Navegador
//
//  Created by Profesor on 29/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimacionesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;

- (IBAction)animarSimple:(id)sender;
- (IBAction)animacionCallback:(id)sender;
- (IBAction)animacionOpciones:(id)sender;
- (IBAction)stopAnimation:(id)sender;

@end
