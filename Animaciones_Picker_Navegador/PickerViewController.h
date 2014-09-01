//
//  PickerViewController.h
//  Animaciones_Picker_Navegador
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface PickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *paisesPicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *fechaPicker;

@end
