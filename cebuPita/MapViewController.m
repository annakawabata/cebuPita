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

@implementation MapViewController

//@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self mapCreate];
    
    //MapViewオブジェクトを生成
    MKMapView *mapView = [[MKMapView alloc] init];
    
    //デリゲートを設定
    mapView.delegate = self;
    
    //大きさ、位置を決定
    mapView.frame = CGRectMake(0,20,self.view.bounds.size.width,self.view.bounds.size.height-20);
    
    //表示位置を決定
    CLLocationCoordinate2D co;
    
    //アヤラの位置を決定
    co.latitude = 10.317347;//緯度
    co.longitude = 123.905759;//軽度
    
    [mapView setCenterCoordinate:co];
    
    //縮尺を指定
    MKCoordinateRegion cr = mapView.region;
    
    //地図の範囲を指定(緯度)
    cr.span.latitudeDelta = 0.08;
    
    //地図の範囲を指定(軽度)
    cr.span.longitudeDelta = 0.08;
    
    cr.center = co;
    
    [mapView setRegion:cr];
    
    //地図の表示種類の設定
    mapView.mapType = MKMapTypeStandard;
    MKPointAnnotation *pin1 = [[MKPointAnnotation alloc] init];
    pin1.coordinate = CLLocationCoordinate2DMake(10.314564,123.891777);
    
    pin1.title = @"セブ・ドクターズ・ユニバーシティ病院";
    pin1.subtitle = @"Cebu Doctor's Univercity Hospital";
    
    [mapView addAnnotation:pin1];
    
    MKPointAnnotation *pin2 = [[MKPointAnnotation alloc] init];
    pin2.coordinate = CLLocationCoordinate2DMake(10.310474,123.890833);
    
    pin2.title = @"チョン・フア病院";
    pin2.subtitle = @"Chong Hua Hospital";
    
    [mapView addAnnotation:pin2];
    
    
    MKPointAnnotation *pin3 = [[MKPointAnnotation alloc] init];
    pin3.coordinate = CLLocationCoordinate2DMake(10.315615,123.895822);
    
    pin3.title = @"パーパチュアル・スコア病院";
    pin3.subtitle = @"Perpetual Succour Hospital";
    
    [mapView addAnnotation:pin3];
    
    
    MKPointAnnotation *pin4 = [[MKPointAnnotation alloc] init];
    pin4.coordinate = CLLocationCoordinate2DMake(10.296605,123.88854);
    
    pin4.title = @"ドクターデンタルクリニック";
    pin4.subtitle = @"Docor Dental Clinic";
    
    [mapView addAnnotation:pin4];
    
    
    MKPointAnnotation *pin5 = [[MKPointAnnotation alloc] init];
    pin5.coordinate = CLLocationCoordinate2DMake(10.321574,123.912808);
    
    pin5.title = @"桜デンタルクリニック";
    pin5.subtitle = @"Sakura Dental Clinic";
    
    [mapView addAnnotation:pin5];
    
    
    
    //表示するためにViewに追加
    [self.view addSubview:mapView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



    //ピンを表示する際に発動されるデリゲートメソッド
    //ピンが降ってくるアニメーションの設定
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    
    //現在地表示なら nil を返す
    if(annotation == mapView.userLocation){
        return nil;
    }
    static NSString *pinIdentifier = @"PinAnnotationID";
    
    //ピン情報の再利用
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIdentifier];
    
    if(pinView == nil){
        //初期化
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIdentifier];
        
        //落ちるアニメーションの設定
        pinView.animatesDrop = YES;
    }
    //吹き出し設定
    pinView.canShowCallout = YES;
    
    return pinView;
}

@end
