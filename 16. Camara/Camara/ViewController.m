//
//  ViewController.m
//  Camara
//
//  Created by Profesor on 8/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView * error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Su dispositivo no tiene camara disponible" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [error show];
    }
}
- (IBAction)tomarFoto:(id)sender {
    UIImagePickerController * camara = [[UIImagePickerController alloc] init];
    camara.delegate = self;
    camara.sourceType = UIImagePickerControllerSourceTypeCamera;
    [camara setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    [self presentViewController:camara animated:YES completion:nil];
}
- (IBAction)seleccionarFoto:(id)sender {
    UIImagePickerController * libreria = [[UIImagePickerController alloc] init];
    libreria.delegate = self;
    libreria.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:libreria animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * foto = info[UIImagePickerControllerOriginalImage];
    _imageView.image = foto;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(foto, nil, nil, nil);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
