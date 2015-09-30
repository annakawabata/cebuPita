//
//  ViewController.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/09/22.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "ViewController.h"
#import "customCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //レストの内容になる配列を用意する
    _hospitalArray = @[@{@"name":@"Cebu Doctor's Univercity Hospital",@"address":@"Osmeña Boulevard, Cebu City, 6000 Cebu",@"phoneNumber":@"(032) 255 5555",@"cost":@""},
                     @{@"name":@"Chong Hua Hospital",@"address":@"Don Mariano Cui Street, Fuente Osmeña, Cebu City, 6000",@"phoneNumber":@"(032) 255 8000",@"cost":@"",},
                     @{@"name":@"",@"address":@"Gorordo Avenue, Lahug, Cebu City, 6000 Cebu",@"phoneNumber":@"(032) 233 8620",@"cost":@"",},
                     @{@"name":@"",@"address":@"",@"phoneNumber":@"",@"cost":@"",},
                     @{@"name":@"",@"address":@"",@"phoneNumber":@"",@"cost":@"",}
                     ];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    //カスタムセルを設定
    //カスタマイズしたセルをテーブルビューで使えるようにするためnibを宣言する
    //nilとはxibファイルのこと
    UINib *nib=[UINib nibWithNibName:@"customCell" bundle:nil];
    
    //使用する
    [self.myTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
}


//行数を返す
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _hospitalArray.count;
}


//定数を宣言
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    
    //セルの再利用(id名をつける)
    customCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.mapImageView.image = [UIImage imageNamed:_hospitalArray[indexPath.row][@"image"]];
    
    
    cell.hospitalLabel.text = _hospitalArray[indexPath.row][@"name"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



//行が押されたときに反応
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"行番号 = %ld",indexPath.row);
    
    //遷移(せんい)先画面のカプセル化(インスタンス化)
    //（移動した先の画面を実体化、指定できるよにした）
    mapViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"mapViewController"];
    
    //押された番号を遷移先画面のプロパティにセット
    //int型に変換する (int)indexPath.row
    //帰れない型だとエラーが出る
    //dvc.selectNum = (int)indexPath.row;
    
    //ナビゲーションコントローラーの機能で画面遷移
    //右側からくる動作がアニメーション：YESでアニメーション使用 NO:で使用しない
    [[self navigationController] pushViewController:dvc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}


@end
