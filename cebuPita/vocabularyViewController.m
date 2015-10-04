//
//  vocabularyViewController.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/02.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "vocabularyViewController.h"
#import "vocabularyTableViewCell.h"

@interface vocabularyViewController ()

@end

@implementation vocabularyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _vocabularyArray1 = @[@"「目が痛いです」",
                          @"「I have sore eyes.」"];
    
    _vocabularyArray2 = @[@"「お腹が痛いです」",
                          @"「I have .」",
                          @""];
    
    _vocabularyArray3 = @[@"",
                          @""];
    
    _vocabularyArray4 = @[@"",
                          @""];
    
    _vocabularyArray5 = @[@"",
                          @""];
    
    _vocabularyArray6 = @[@"",
                          @""];

    
    
    
    
    self.vocabularyTableView.delegate = self;
    self.vocabularyTableView.dataSource = self;
    
    
    //カスタムセルを設定
    //カスタマイズしたセルをテーブルビューで使えるようにするためnibを宣言する
    //nilとはxibファイルのこと
    UINib *nib=[UINib nibWithNibName:@"vocabularyCell" bundle:nil];
    
    //使用する
    [self.vocabularyTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
}


//行数を返す
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int x;
    
    switch (self.selectNum) {
        case 0:
            x= (int)_vocabularyArray1.count;
            break;
        case 1:
            x= (int) _vocabularyArray2.count;
            break;
        case 2:
            x= (int) _vocabularyArray3.count;
            break;
        case 3:
            x= (int) _vocabularyArray4.count;
            break;
        case 4:
            x= (int) _vocabularyArray5.count;
            break;
        case 5:
            x= (int) _vocabularyArray6.count;
            break;
        default:
            break;
    }return x;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    
    vocabularyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil){//セルという定数をつけている
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
    
    
    
    
    switch (self.selectNum) {
        case 0:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray1[indexPath.row]];
            break;
        case 1:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray2[indexPath.row]];
            break;
        case 2:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray3[indexPath.row]];
            break;
        case 3:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray4[indexPath.row]];
            break;
        case 4:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray5[indexPath.row]];
            break;
        case 5:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray6[indexPath.row]];
            break;
        default:
            break;
    };
    
    if (indexPath.row % 2 == 0) {
      //  cell.textLabel.text = @"";
      //  cell.detailTextLabel.text = @"green";
        cell.backgroundColor = [UIColor colorWithHue:0.45
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:1.0];     // does not work
        
        // does not work
    }
    // For odd
    else {
        //cell.textLabel.text = @"";
       // cell.detailTextLabel.text = @"blue";
        cell.backgroundColor = [UIColor colorWithHue:0.65
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:1.0];     // does not work
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
