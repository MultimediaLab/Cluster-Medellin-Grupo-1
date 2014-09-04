//
//  ViewController.m
//  DelegadosYProtocolos
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    FileAccess * file;

}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    file = [[FileAccess alloc] init];
    file.delegate = self;
    _deleteMessage.hidden = YES;
   
}

//Obligatorios del Protocolo
-(void)downloadDidFinishLoading:(NSString *)name{
    NSLog(@"Carga Finalizada");
}
-(void)downloadFinishLoading:(NSString *)filePath andName:(NSString *)name{
    //NSLog(@"Archivo Creado");
    NSData * imgData = [NSData dataWithContentsOfFile:filePath];
    _imageUser.image = [[UIImage alloc] initWithData:imgData];
    
}
-(void)downloadInitLoading:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"Inicia Carga");
}

//Opcionales
-(void)downloadFinishLoading:(NSURLConnection *)connection didFailWithError:(NSError *)error andName:(NSString *)name{
    NSLog(@"Error");
}
-(void)downloadChangeLoading:(NSURLConnection *)connection didReceiveData:(NSData *)data andProgress:(float)progress{
   // NSLog(@"Progreso: %f%%", progress*100);
    _progressBar.progress = progress;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)downloadInitButton:(id)sender {
    
    _deleteMessage.hidden = YES;
    [file downloadFile:_urlUser.text withName:_nameUser.text];
    
    [self.view endEditing:YES];

}

- (IBAction)deleteButton:(id)sender {

    _deleteMessage.text = [file removeFile:_nameUser.text];
    
    _imageUser.image = nil;
    _deleteMessage.hidden = NO;
}
@end
