//
//  FileAccessDelegate.h
//  DelegadosYProtocolos
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FileAccessDelegate <NSObject>

//Metodos que son requeridos
@required

//Metodo cuando termina la carga de una ruta con nombre
-(void)downloadFinishLoading:(NSString*)filePath andName:(NSString*)name;

//Termina Carga de un nombre de archivo
-(void)downloadDidFinishLoading:(NSString*)name;

//Iniciar Descarga
-(void)downloadInitLoading:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response;

//Metodos que son opcionales
@optional

//Fallo la descarga con error
-(void)downloadFinishLoading:(NSURLConnection*)connection didFailWithError:(NSError*)error andName:(NSString*)name;

//Modifique el porcente de carga
-(void)downloadChangeLoading:(NSURLConnection*)connection didReceiveData:(NSData*)data andProgress:(float)progress;

@end
