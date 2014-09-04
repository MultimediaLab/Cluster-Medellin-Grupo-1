//
//  ViewController.m
//  EdadApp
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Crear instancia de la clase
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)userTouchButtonValidate:(id)sender {
    
    Person * user = [[Person alloc] init];
    [user setName:_userText.text];
    [user setAge:[_userAge.text intValue]];
    
    if ([user isUserAdult]) {
        _userResult.text = [NSString stringWithFormat:@"%@ tiene %@ y es mayor de edad", _userText.text, _userAge.text];
    }else{
        _userResult.text = [NSString stringWithFormat:@"%@ tiene %@ y es menor de edad", _userText.text, _userAge.text];
    }
    
    [self.view endEditing:YES];
}
@end
