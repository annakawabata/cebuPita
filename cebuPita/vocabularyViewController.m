//
//  vocabularyViewController.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/02.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "vocabularyViewController.h"

@interface vocabularyViewController ()

@end

@implementation vocabularyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _vocabularyArray.count;
    //_coffeeArray.countに入ってる数分だけ表示する
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
