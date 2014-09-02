//
//  Empleados.m
//  Empleados
//
//  Created by Profesor on 1/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Empleados.h"

@interface Empleados ()

@property NSString * databasePath;
@property NSInteger e_Id;

@end

@implementation Empleados

-(void)createDatabaseInDocuments{
    NSString * rutaDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _databasePath = [[NSString alloc] initWithString:[rutaDoc stringByAppendingPathComponent:@"empleados.db"]];
    
    NSFileManager * fm = [[NSFileManager alloc] init];
    NSLog(@"%@", _databasePath);
    
    if ([fm fileExistsAtPath:_databasePath]==NO) {
        NSLog(@"El archivo no existe");
        const char * dbpath = [_databasePath UTF8String];
        if (sqlite3_open(dbpath, &empleadosdb)==SQLITE_OK) {
            NSLog(@"El archivo fue creado");
            
            char * errMsg;
            const char * sql_stmt ="CREATE TABLE IF NOT EXISTS EMPLOYESS (ID INTEGER PRIMARY KEY AUTOINCREMENT, EMP_CEDULA TEXT, EMP_NAME TEXT, EMP_AGE TEXT, EMP_ADRESS TEXT)";
            
            if (sqlite3_exec(empleadosdb, sql_stmt, NULL, NULL, &errMsg)==SQLITE_OK) {
                NSLog(@"Tabla Creada Exitosamente!!..");
            }else{
                NSLog(@"Error en crear Tabla!!..:%s", errMsg);
            }
        }else{
            NSLog(@"Erro en crear la base de datos");
        }
    }else{
        NSLog(@"El archivo ya existe, no se remplazo");
    }
}
-(void)searchEmployedInDataBasebyId:(NSString*)cedula{

}
@end
