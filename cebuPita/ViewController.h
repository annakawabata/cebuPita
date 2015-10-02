//
//  ViewController.h
//  cebuPita
//
//  Created by 川端杏奈 on 2015/09/22.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "customCell.h"
#import <MapKit/MapKit.h>
#import "MapViewController.h"
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "vocabularyViewController.h"




@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_hospitalArray;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end

