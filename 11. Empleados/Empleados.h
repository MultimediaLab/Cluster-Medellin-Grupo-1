//
//  Empleados.h
//  Empleados
//
//  Created by Profesor on 1/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>



@interface Empleados : NSObject{
    sqlite3 * empleadosdb;
}

@property NSString * empId;
@property NSString * empName;
@property NSString * empAdress;
@property NSString * empAge;
@property NSString * empCedula;

@property NSString * status;

-(void)createDatabaseInDocuments;
-(void)searchEmployedInDataBasebyId:(NSString*)cedula;
-(void)createEmployedInDataBase;


@end
