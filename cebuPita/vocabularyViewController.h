//
//  vocabularyViewController.h
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/02.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface vocabularyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_vocabularyArray1;
    NSArray *_vocabularyArray2;
    NSArray *_vocabularyArray3;
    NSArray *_vocabularyArray4;
    NSArray *_vocabularyArray5;
    NSArray *_vocabularyArray6;
    NSArray *_vocabularyArray7;
    NSArray *_vocabularyArray8;
    NSArray *_vocabularyList;
}
@property (weak, nonatomic) IBOutlet UITableView *vocabularyTableView;
@property (nonatomic,assign) int selectNum;

@end
