//
//  ViewController.h
//  Camara
//
//  Created by Profesor on 8/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>



@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)tomarFoto:(id)sender;
- (IBAction)seleccionarFoto:(id)sender;

@end
