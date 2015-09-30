//
//  CustomAnnoation.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/09/30.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnnotation.h"

@implementation CustomAnnoation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)co newTitle:(NSString *)t newSubTitle:(NSString *)st;
{
    self = [super self];
    
    if(self != nil)
    {
        coordinate = co;
        title = t;
        subtitle = st;
    }
    
    return self;
}



@end
