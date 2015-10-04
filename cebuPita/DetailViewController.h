//
//  DetailViewController.h
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/04.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "vocabularyViewController.h"

@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_vocabularyArray;
}

@property (weak, nonatomic) IBOutlet UITableView *DetailTableView;

@end
