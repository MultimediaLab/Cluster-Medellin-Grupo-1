//
//  FileAccess.h
//  DelegadosYProtocolos
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileAccessDelegate.h"

@interface FileAccess : NSObject <NSURLConnectionDataDelegate>

@property id <FileAccessDelegate> delegate;

//Metodo para iniciar la descarga del archivo
-(void)downloadFile:(NSString*)url withName:(NSString*)name;

//Metodo para borrar los archivos
-(NSString*)removeFile:(NSString*)name;

@end
