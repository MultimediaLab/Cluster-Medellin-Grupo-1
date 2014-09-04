//
//  Model.m
//  iCalendar
//
//  Created by Profesor on 1/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//
#import "Model.h"
#import "CalendarioViewController.h"

@interface Model()
@property (readonly, strong, nonatomic) NSArray * pageData;
@end

@implementation Model
//Metodos Propios del Modelo
-(id)init{
    self = [super init];
    if (self) {
        _pageData = [NSArray arrayWithObjects:@"Enero", @"Febrero",@"Marzo", @"Abril", @"Mayo", @"Junio", @"Julio", @"Agosto", @"Septiembre", @"Octubre", @"Noviembre", @"Diciembre", nil];
    }
    NSLog(@"%@",_pageData);
    return self;
}

-(CalendarioViewController *)viewControllerAtIndex:(NSInteger)index storyboard:(UIStoryboard *)storyboard{
    if (index>=[_pageData count]) {
        return nil;
    }
    CalendarioViewController * calendar = [storyboard instantiateViewControllerWithIdentifier:@"Calendario"];
    calendar.dataObject = [_pageData objectAtIndex:index];
    return calendar;
}

-(NSUInteger)indexOfViewController:(CalendarioViewController *)viewController{
    return [_pageData indexOfObject:viewController.dataObject];
}
//Metodos del Protocolo UIPageViewController
//Metodo cuando paso la pagina hacia adelante
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger indice = [self indexOfViewController:(CalendarioViewController*)viewController];
    if (indice == [_pageData count]-1) {
        return nil;
    }
    indice++;
    return [self viewControllerAtIndex:indice storyboard:viewController.storyboard];

}
//Metodo cuando paso la pagina hacia atras
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger indice = [self indexOfViewController:(CalendarioViewController*)viewController];
    if (indice == 0) {
        return nil;
    }
    indice--;
    return [self viewControllerAtIndex:indice storyboard:viewController.storyboard];
}
@end
