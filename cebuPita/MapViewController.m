//
//  MapViewController.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/09/30.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "MapViewController.h"
#import "CustomAnnotation.h"

@interface MapViewController ()<MKMapViewDelegate>

@property (nonatomic, retain) MKMapView *mapView;

@end

@implementation MapViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mapCreate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void) mapCreate
{
    /* 本当はここを動的に変更できるようにするといいと思う */
    // 緯度経度
    float now_latitude = 35.7100721; // 経度
    float now_longitude = 139.809471; // 緯度
    // タイトル/サブタイトル
    NSString *title = @"たいとる";
    NSString *subTitle = @"さぶさぶさぶ";
    /* 本当はここを動的に変更できるようにするといいと思う */
    
    // 経度緯度設定
    CLLocationCoordinate2D locationCoordinate = CLLocationCoordinate2DMake(now_latitude, now_longitude);
    
    // マップ生成
    mapView = [[MKMapView alloc] init];
    mapView.frame = CGRectMake(0,0,320,480);
    mapView.delegate = self;
    mapView.showsUserLocation = YES;  // ユーザの現在地を表示するように設定
    [mapView setCenterCoordinate:locationCoordinate animated:NO];
    
    // CustomAnnotationクラスの初期化
    CustomAnnotation *customAnnotation = [[CustomAnnotation alloc] initWithCoordinates:locationCoordinate newTitle:title newSubTitle:subTitle];
    
    // annotationをマップに追加
    [mapView addAnnotation:customAnnotation];
    
    // マップを表示
    [self.view addSubview:self.mapView];
}

#pragma - mapkit delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *annotationView;
    
    // 再利用可能なannotationがあるかどうかを判断するための識別子を定義
    NSString *identifier = @"Pin";
    
    // "Pin"という識別子のついたannotationを使いまわせるかチェック
    annotationView = (MKAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    // 使い回しができるannotationがない場合、annotationの初期化
    if(annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    
    // 画像をannotationに設定設定
    annotationView.image = [UIImage imageNamed:@"test_icon.png"];
    annotationView.canShowCallout = YES;  // この設定で吹き出しが出る
    annotationView.annotation = annotation;
    
    //ボタンの種類を指定（ここがないとタッチできない）
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = detailButton;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    NSLog(@"ピンの吹き出しが押された");
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Safariで開きますか？" message:@"どうすんの？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"はい", @"いいえ", nil];
    [alert show];
}

#pragma - alertview delegate

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    /* 本当はここを動的に変更できるようにするといいと思う */
    float now_latitude = 35.7100721; // 経度
    float now_longitude = 139.809471; // 緯度
    /* 本当はここを動的に変更できるようにするといいと思う */
    
    
    // マップAPIへ投げるURLの準備
    NSString *apiUrl = @"http://maps.google.co.jp/maps?q=";
    
    // マップAPIへ投げるURLにパラメタを設定（文字列連結）
    NSString *url = [NSString stringWithFormat:@"%@%f,%f(here!)&hl=ja", apiUrl, now_latitude, now_longitude];
    
    NSLog(@"マップAPIに投げるURL = %@", url);
    
    switch (buttonIndex)
    {
        case 0:
            //１番目のボタンが押されたときの処理を記述する
            NSLog(@"safariに飛ばすよ");
            // safariに飛ばす
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
            
            break;
        case 1:
            //２番目のボタンが押されたときの処理を記述する
            NSLog(@"キャンセルされたよ");
            break;
    }
}


@end
