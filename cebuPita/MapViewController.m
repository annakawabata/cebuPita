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


@end

@implementation MapViewController {
    //マップ縮尺度＋初期位置の最初のセットが済んでいるかどうか
    BOOL alreadyStartingCoordinateSet_; //YES：セット済み NO：未セット
}

- (id)init {
    if (self = [super init]) {
        alreadyStartingCoordinateSet_ = NO;
    }
    return  self;
}

//@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mapView.delegate = self;

    //地図の表示種類の設定
    self.mapView.mapType = MKMapTypeStandard;
    MKPointAnnotation *pin1 = [[MKPointAnnotation alloc] init];
    pin1.coordinate = CLLocationCoordinate2DMake(10.314564,123.891777);
    
    pin1.title = @"セブ・ドクターズ・ユニバーシティ病院";
    pin1.subtitle = @"Cebu Doctor's Univercity Hospital";
    
    [self.mapView addAnnotation:pin1];
    
    MKPointAnnotation *pin2 = [[MKPointAnnotation alloc] init];
    pin2.coordinate = CLLocationCoordinate2DMake(10.310474,123.890833);
    
    pin2.title = @"チョン・フア病院";
    pin2.subtitle = @"Chong Hua Hospital";
    
    [self.mapView addAnnotation:pin2];
    
    
    MKPointAnnotation *pin3 = [[MKPointAnnotation alloc] init];
    pin3.coordinate = CLLocationCoordinate2DMake(10.315615,123.895822);
    
    pin3.title = @"パーパチュアル・スコア病院";
    pin3.subtitle = @"Perpetual Succour Hospital";
    
    [self.mapView addAnnotation:pin3];
    
    
    MKPointAnnotation *pin4 = [[MKPointAnnotation alloc] init];
    pin4.coordinate = CLLocationCoordinate2DMake(10.296605,123.88854);
    
    pin4.title = @"ドクターデンタルクリニック";
    pin4.subtitle = @"Docor Dental Clinic";
    
    [self.mapView addAnnotation:pin4];
    
    
    MKPointAnnotation *pin5 = [[MKPointAnnotation alloc] init];
    pin5.coordinate = CLLocationCoordinate2DMake(10.321574,123.912808);
    
    pin5.title = @"桜デンタルクリニック";
    pin5.subtitle = @"Sakura Dental Clinic";
    
    [self.mapView addAnnotation:pin5];
    
    /*
     location設定
     */
    //ユーザーによる位置情報サービスの許可状態をチェック
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        //ユーザーはこのアプリによる位置情報サービスの利用を許可していない、または「設定」で無効にしている
        NSLog(@"Location services is unauthorized.");
    }
    else {
        //位置情報サービスを利用できる、またはまだ利用許可要求を行っていない
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        //利用許可要求をまだ行っていない状態であれば要求
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            //許可の要求
            //アプリがフォアグラウンドにある間のみ位置情報サービスを使用する許可を要求
            [self.locationManager requestWhenInUseAuthorization];
        }
        //精度要求
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        //最小移動間隔
        self.locationManager.distanceFilter = 100.0; //100m 移動ごとに通知
        
        //測位開始
        [self.locationManager startUpdatingLocation];
        
        
    }
    
    //ユーザの回転を許可しない
    self.mapView.rotateEnabled = NO;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


    /*
    CLLocationManagerDelegate
    */
    //位置情報更新時に呼ばれる
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //ユーザの位置を表示するかどうか
    self.mapView.showsUserLocation = YES;
    
    //最新の位置情報を取得し、そこからマップの中心座標を決定
    CLLocation *currentLocation = locations.lastObject;
    CLLocationCoordinate2D centerCoordinate = currentLocation.coordinate;
    //縮尺度を指定
    MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.1, 0.1); //数が小さいほど拡大率アップ
    
    //設定した縮尺で現在地を中心としたマップをセット（初回1回のみ）
    if (alreadyStartingCoordinateSet_ == NO) {
        MKCoordinateRegion newRegion = MKCoordinateRegionMake(centerCoordinate, coordinateSpan);
        [self.mapView setRegion:newRegion animated:YES];
        alreadyStartingCoordinateSet_ = YES;
    }
}


//測位失敗時・位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError.");
}

@end
