//
//  Person.h
//  EdadApp
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString * name;
    int age;
}

//Get age
-(int)age;

//Set age
-(void)setAge: (int)value;

//Get name
-(NSString*)name;

//Set name
-(void)setName: (NSString*)value;

-(BOOL)isUserAdult;

@end
