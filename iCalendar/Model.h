//
//  Model.h
//  iCalendar
//
//  Created by Profesor on 1/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalendarioViewController;


@interface Model : NSObject <UIPageViewControllerDataSource>


//Metodo que retorne el viewcontroller de cada mes
-(CalendarioViewController*) viewControllerAtIndex: (NSInteger)index storyboard:(UIStoryboard*)storyboard;

//Metodo que retorne el numero del mes dependiendo del viewcontroller
-(NSUInteger) indexOfViewController:(CalendarioViewController*)viewController;

@end
