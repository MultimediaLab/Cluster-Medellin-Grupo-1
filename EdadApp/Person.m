//
//  Person.m
//  EdadApp
//
//  Created by Developer Cymetria on 13/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "Person.h"

@implementation Person

-(int)age{
    return age;
}
-(void)setAge: (int)value{
    age = value;
}

-(NSString*)name{
    return name;
}
-(void)setName: (NSString*)value{
    name=value;
}
-(BOOL)isUserAdult{
    if (age>=18) {
        return YES;
    }
    return NO;
}
@end
