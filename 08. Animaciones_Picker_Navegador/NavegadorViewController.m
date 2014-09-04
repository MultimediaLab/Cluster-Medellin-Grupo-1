//
//  NavegadorViewController.m
//  Animaciones_Picker_Navegador
//
//  Created by Profesor on 27/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "NavegadorViewController.h"

@interface NavegadorViewController ()

@end

@implementation NavegadorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _navegador.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)htmlButton:(id)sender {
    NSString * html = @"<h1>Hola desde HTML</h1><p style='color:red;'>Parrafo de texto</p>";
    [_navegador loadHTMLString:html baseURL:nil];
}
- (IBAction)jsButton:(id)sender {
    NSString * script = @"alert('Hola desde JS');";
    [_navegador stringByEvaluatingJavaScriptFromString:script];
}
- (IBAction)webButton:(id)sender {
    NSURL * url = [[NSURL alloc] initWithString:@"http://apple.com"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    [_navegador setScalesPageToFit:NO];
    [_navegador loadRequest:request];
}

- (IBAction)pdfButton:(id)sender {
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"informe" ofType:@"pdf"];
    NSData * datosPDF = [[NSData alloc] initWithContentsOfFile:ruta];
    [_navegador setScalesPageToFit:YES];
    [_navegador loadData:datosPDF MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_animacion startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_animacion stopAnimating];
}
//En el view did load -->  _navegador.delegate = self;
@end
