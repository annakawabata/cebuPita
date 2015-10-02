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
    NSArray *_vocabularyArray;
    NSArray *dataDetail1;//メンバー変数を宣言
}
@property (weak, nonatomic) IBOutlet UITableView *vocabularyTableView;

@end
