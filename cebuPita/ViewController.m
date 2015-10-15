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
#import "AppDelegate.h"


@interface ViewController (){
    AppDelegate *_appdeligate;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Cebu Pita";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.myTableView.backgroundColor = [UIColor clearColor];
    
    //レストの内容になる配列を用意する
    _hospitalArray = @[@{@"name":@"Cebu Doctor's Univercity Hospital",@"address":@"Osmeña Boulevard, Cebu City, 6000 Cebu",@"phoneNumber":@"(032) 255 5555,032-516-3341（日本語直通）",@"cost":@"1500ペソ〜",@"time":@"午前9時～午後6時（月～金）,午前9時～12時（土）,24時間救急外来",@"langage":@"日本語可",@"image":@"cebudoc.jpg",@"lati":@"10.314564",@"longi":@"123.891777"},
                     @{@"name":@"Chong Hua Hospital",@"address":@"Don Mariano Cui Street, Fuente Osmeña, Cebu City, 6000",@"phoneNumber":@"(032) 255 8000",@"cost":@"1500ペソ〜",@"time":@"",@"langage":@"英語",@"image":@"hospitalImage02.jpg",@"lati":@"10.310474",@"longi":@"123.890833"},
                     @{@"name":@"Perpetual Succour Hospital",@"address":@"Gorordo Avenue, Lahug, Cebu City, 6000 Cebu",@"phoneNumber":@"(032) 233 8620",@"cost":@"1500ペソ〜",@"time":@"",@"langage":@"英語",@"image":@"papatual.jpg",@"lati":@"10.315615",@"longi":@"123.895822"},
                     @{@"name":@"Docor Dental Clinic",@"address":@"Miller Hospital 400 Tres de Abril St. Cebu City",@"phoneNumber":@"(032) 238-8012 or (032)261-6082、rodivickdocor@yahoo.com（日本語可）",@"cost":@"VisaとMaster,1000ペソ〜3000ペソ程度",@"time":@"日～金8:30～17:00（17:00～21:00は要予約）",@"langage":@"日本語可",@"image":@"cebudental.jpg",@"lati":@"10.296605",@"longi":@"123.88854"},
                     @{@"name":@"Sakura Dental Clinic",@"address":@"Alcon Arcade BD. F.Cabahug st. Mabolo Cebu city",@"phoneNumber":@"032-414-0775／0917-771-4061（日本語対応）",@"cost":@"日本の国民健康保険・社会保険などをお持ちの方のために保険用書類を作成してくれます。",@"time":@"午前10時～午後1時／午後2時～午後7時,定休日：フィリピンの祝日・日曜日",@"langage":@"日本語可",@"image":@"sakura.jpg",@"lati":@"10.321574",@"longi":@"123.912808"},
                     @{@"name":@"Saint Anthony Mother and Child Hospital",@"address":@"Basak San Nicolas, Cebu City, 6000",@"phoneNumber":@"(032) 261 9989",@"cost":@"800ペソ~",@"time":@"",@"langage":@"英語",@"image":@"SaintAnthony.jpg",@"lati":@"10.286099",@"longi":@"123.870383"},
                     @{@"name":@"CEBU VELEZ Hospital",@"address":@"F. Ramos St, Cebu City, Cebu",@"phoneNumber":@"(032) 253 1871",@"cost":@"詳細なし",@"time":@"詳細なし",@"langage":@"英語",@"image":@"belez.jpg",@"lati":@"10.30702",@"longi":@"123.896541"},
                     @{@"name":@"Sacred Heart Hospital Urgello Cebu City",@"address":@"J Urgello St. Cebu City、J. Urgello St、Cebu City",@"phoneNumber":@"(032) 418 8410",@"cost":@"詳細なし",@"time":@"詳細なし",@"langage":@"英語",@"image":@"sakured.jpg",@"lati":@"10.303314",@"longi":@"123.891681"},
                     @{@"name":@"Mactan Doctor’s Hospital",@"address":@"Basak, Lapu-Lapu City, Mactan",@"phoneNumber":@"(032) 255 5555",@"cost":@"1000ペソ~",@"time":@"月曜日～金曜日 9：00～18：00　土曜日 9：00～12：00(２４時間対応)",@"langage":@"英語:日本語可",@"image":@"mactan.jpg",@"lati":@"10.291024",@"longi":@"123.961041"},
                     @{@"name":@"South General Hospital",@"address":@"NATIONAL ROAD, TUYAN, NAGA, CEBU",@"phoneNumber":@"032-272-2020",@"cost":@"セブドクターズ系列総合病院。CT-SCANあり。MRIなし。CMSはER受診と入院で利用できます。",@"time":@"24時間（緊急外来）",@"langage":@"英語",@"image":@"south.jpg",@"lati":@"10.232687",@"longi":@"123.771336"},
                     @{@"name":@"CEBU NORTH GENERAL HOSPITAL",@"address":@"KAUSWAGAN ROAD, TALAMBAN CITY, CEBU",@"phoneNumber":@"032-343-7777",@"cost":@"セブドクターズ系列総合病院。　CT-SCANあり。MRIなし。　CMSはER受診と入院で利用できます。",@"time":@"24時間（緊急外来）",@"langage":@"英語",@"image":@"north.jpg",@"lati":@"10.373479",@"longi":@"123.914539"}
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
                                               alpha:0.8];
    }
    // For odd
    else {
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"blue";
        cell.backgroundColor = [UIColor colorWithHue:0.1
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:0.8];
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
    
    //Viewからアップデリゲートに渡す準備している
    float lati =[_hospitalArray[indexPath.row][@"lati"] floatValue];
    float longi =[_hospitalArray[indexPath.row][@"longi"] floatValue];
    
    NSLog(@"lati = %f",lati);
    NSLog(@"longi = %f",longi);
    
    _appdeligate.endLati = lati;
    _appdeligate.endLongi = longi;
    
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
