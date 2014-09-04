//
//  FileAccess.m
//  DelegadosYProtocolos
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "FileAccess.h"
@interface FileAccess()
@property long long expectedLength;
@property NSString * fileName;
@property NSMutableData * fileData;

@end

@implementation FileAccess
static float progress = 0.0f;

#pragma mark Metodos del Delegado NSURLConnectionData
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.expectedLength = [response expectedContentLength];
    progress = 0.0f;
    
    if ([self.delegate respondsToSelector:@selector(downloadInitLoading:didReceiveResponse:)]) {
        [self.delegate downloadInitLoading:connection didReceiveResponse:response];
    }
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    progress += [data length];
    [_fileData appendData:data];
    
    [self.delegate downloadChangeLoading:connection didReceiveData:data andProgress:(progress/(float)_expectedLength)];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
    [self.delegate downloadFinishLoading:connection didFailWithError:error andName:_fileName];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    [self.delegate downloadDidFinishLoading:_fileName];
    
    //Metodo que me almacene en el documents
    [self saveDocuments:_fileData andName:_fileName];
}

#pragma mark Metodos de Clase FileAccess
-(void)saveDocuments:(NSData*)imageData andName:(NSString*)name{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * imageFolder = [[paths lastObject] stringByAppendingPathComponent:@"/files"];
    
    BOOL isDir = NO;
    
    NSFileManager * fileManager = [[NSFileManager alloc] init];
    if (![fileManager fileExistsAtPath:imageFolder isDirectory:&isDir] && isDir==NO) {
        [fileManager createDirectoryAtPath:imageFolder withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSString * filePath = [imageFolder stringByAppendingPathComponent:name];
    NSError * writeError = nil;
    
    [imageData writeToFile:filePath options:NSDataWritingAtomic error:&writeError];
    
    if (writeError) {
        NSLog(@"%@", writeError);
        [self.delegate downloadFinishLoading:nil didFailWithError:writeError andName:name];
    }
    
    [self.delegate downloadFinishLoading:filePath andName:name];
}

-(void)downloadFile:(NSString*)url withName:(NSString*)name{
    _fileName = name;
    _fileData = [[NSMutableData alloc] init];
    NSURL * urlData = [NSURL URLWithString:url];
    NSURLRequest * request = [NSURLRequest requestWithURL:urlData];
    
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    [connection start];

}
-(NSString*)removeFile:(NSString*)name{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * imageFolder = [[paths lastObject] stringByAppendingString:@"/files/"];
    
    imageFolder = [imageFolder stringByAppendingString:name];
    
    NSLog(@"%@",imageFolder);
    
    NSFileManager * fn = [[NSFileManager alloc] init];
    
    NSError * error = nil;
    
    [fn removeItemAtPath:imageFolder error:&error];
    
    if (error) {
        NSLog(@"Error en borrado: %@", error);
        return [NSString stringWithFormat:@"Error en borrado: %@", error];
    }
    
    return [NSString stringWithFormat:@"Borrado Exitoso!! Carga una nueva imagen!! :) "];
}
@end
