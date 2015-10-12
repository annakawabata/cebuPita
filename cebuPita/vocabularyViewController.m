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
    
    self.title = @"List";
    
    //self.vocabularyText.backgroundColor = [UIColor clearColor];
    
    self.vocabularyTableView.backgroundColor = [UIColor clearColor];

    
    //プロジェクト内のファイルにアクセスするオブジェクトを作成
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    
    NSString *path = [bundle pathForResource:@"words" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *wordList = [dic objectForKey:@"wordList"];
    
    for (NSDictionary *word in wordList) {
        NSLog(@"title=%@",word[@"title"]);
        if([word[@"title"] isEqualToString:@"目 : Eye" ]){
            _vocabularyArray1 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"腹痛 : Stomach" ]){
            _vocabularyArray2 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"嘔吐" ]){
            _vocabularyArray3 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"風邪" ]){
            _vocabularyArray4 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"怪我" ]){
            _vocabularyArray5 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"受付" ]){
            _vocabularyArray6 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"その他" ]){
            _vocabularyArray7 =word[@"words"];
        }
    }
    
    
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
        case 6:
            x= (int) _vocabularyArray7.count;
            break;
        default:
            break;
    }return x;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"hospitalImage03.jpg"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    vocabularyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil){//セルという定数をつけている
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
    
    
    
    switch (self.selectNum) {
        case 0:
            cell.vocabularyText.text = [NSString stringWithFormat:@"%@",_vocabularyArray1[indexPath.row]];
            break;
        case 1:
            cell.vocabularyText.text = [NSString stringWithFormat:@"%@",_vocabularyArray2[indexPath.row]];
            break;
        case 2:
            cell.vocabularyText.text = [NSString stringWithFormat:@"%@",_vocabularyArray3[indexPath.row]];
            break;
        case 3:
            cell.vocabularyText.text = [NSString stringWithFormat:@"%@",_vocabularyArray4[indexPath.row]];
            break;
        case 4:
            cell.vocabularyText.text = [NSString stringWithFormat:@"%@",_vocabularyArray5[indexPath.row]];
            break;
        case 5:
            cell.vocabularyText.text = [NSString stringWithFormat:@"%@",_vocabularyArray6[indexPath.row]];
            break;
        case 6:
            cell.vocabularyText.text = [NSString stringWithFormat:@"%@",_vocabularyArray7[indexPath.row]];
            break;
        default:
            break;
    };
    
    // For even
    if (indexPath.row % 2 == 0) {
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"green";
        cell.backgroundColor = [UIColor colorWithHue:0.45
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:0.7];     // does not work
        
        // does not work
    }
    // For odd
    else {
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"blue";
        cell.backgroundColor = [UIColor colorWithHue:0.1
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:0.7];     // does not work
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}


@end
