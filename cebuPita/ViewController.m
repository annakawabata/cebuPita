//
//  ViewController.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/09/22.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "ViewController.h"
#import "customCell.h"
#import "CustomAnnotation.h"
#import "MapViewController.h"
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "vocabularyViewController.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Cebu Pita";
    
    // 半透明にする.
    UIColor* tableBackgroundColor = [UIColor blackColor];
    tableBackgroundColor = [tableBackgroundColor colorWithAlphaComponent:0.3];
    
    [self.myTableView setBackgroundColor:tableBackgroundColor];
    
    
    
    //レストの内容になる配列を用意する
    _hospitalArray = @[@{@"name":@"Cebu Doctor's Univercity Hospital",@"address":@"Osmeña Boulevard, Cebu City, 6000 Cebu",@"phoneNumber":@"(032) 255 5555,032-516-3341（日本語直通）",@"cost":@"1500ペソ〜",@"time":@"午前9時～午後6時（月～金）,午前9時～12時（土）,24時間救急外来",@"langage":@"日本語可",@"image":@"cebudoc.jpg"},
                     @{@"name":@"Chong Hua Hospital",@"address":@"Don Mariano Cui Street, Fuente Osmeña, Cebu City, 6000",@"phoneNumber":@"(032) 255 8000",@"cost":@"1500ペソ〜",@"time":@"",@"langage":@"英語",@"image":@"hospitalImage02.jpg"},
                     @{@"name":@"Perpetual Succour Hospital",@"address":@"Gorordo Avenue, Lahug, Cebu City, 6000 Cebu",@"phoneNumber":@"(032) 233 8620",@"cost":@"1500ペソ〜",@"time":@"",@"langage":@"英語",@"image":@"papatual.jpg"},
                     @{@"name":@"Docor Dental Clinic",@"address":@"Miller Hospital 400 Tres de Abril St. Cebu City",@"phoneNumber":@"(032) 238-8012 or (032)261-6082、rodivickdocor@yahoo.com（日本語可）",@"cost":@"VisaとMaster,1000ペソ〜3000ペソ程度",@"time":@"日～金8:30～17:00（17:00～21:00は要予約）",@"langage":@"日本語可",@"image":@"cebudental.jpg"},
                     @{@"name":@"Sakura Dental Clinic",@"address":@"Alcon Arcade BD. F.Cabahug st. Mabolo Cebu city",@"phoneNumber":@"032-414-0775／0917-771-4061（日本語対応）",@"cost":@"日本の国民健康保険・社会保険などをお持ちの方のために保険用書類を作成してくれます。",@"time":@"午前10時～午後1時／午後2時～午後7時,定休日：フィリピンの祝日・日曜日",@"langage":@"日本語可",@"image":@"sakura.jpg"}
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
    
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"hospitalImage03.jpg"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    //セルの再利用(id名をつける)
    customCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.mapImageView.image = [UIImage imageNamed:_hospitalArray[indexPath.row][@"image"]];
    cell.backgroundColor = [UIColor clearColor];
    
    
    cell.hospitalLabel.text = _hospitalArray[indexPath.row][@"name"];
    cell.hospitalTextView.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",_hospitalArray[indexPath.row][@"address"],_hospitalArray[indexPath.row][@"phoneNumber"],_hospitalArray[indexPath.row][@"cost"],_hospitalArray[indexPath.row][@"time"],_hospitalArray[indexPath.row][@"langage"]];
    
    // For even
    if (indexPath.row % 2 == 0) {
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"green";
        cell.backgroundColor = [UIColor colorWithHue:0.45
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:1.0];     // does not work

        // does not work
    }
    // For odd
    else {
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"blue";
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



//行が押されたときに反応
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"行番号 = %ld",indexPath.row);
    
    //遷移(せんい)先画面のカプセル化(インスタンス化)
    //（移動した先の画面を実体化、指定できるよにした）
    MapViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    
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
    return 150;
}


@end
