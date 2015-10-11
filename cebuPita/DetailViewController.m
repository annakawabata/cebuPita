//
//  DetailViewController.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/04.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "DetailViewController.h"
#import "vocabularyViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Cebu Pita";
    
    self.DetailTableView.backgroundColor = [UIColor clearColor];

    _vocabularyArray = @[@"目：Eye" ,@"腹痛：Stomach",@"吐き気：Vomiting",@"風邪：cold",@"怪我：Injury",@"受付：Reception",@"その他：Others"];
    
    self.DetailTableView.delegate = self;
    self.DetailTableView.dataSource = self;
    
}


//行数を返す
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _vocabularyArray.count;
}

//定数を宣言
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";

    
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"hospitalImage03.jpg"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){//セルという定数をつけている
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }//空の状態をなくす
    //文字を表示するときは [@"%@" ,_coffeeArray[indexPath.row]];
    //       cell.textLabel.text = [NSString stringWithFormat:@"%@",_coffeeArray[indexPath.row == 0]];
    //    return cell;
    
    
    
    //Configure the cell...
    cell.textLabel.text = [_vocabularyArray objectAtIndex:indexPath.row];
    //cell.imageView.image.size.width = CGFloat(80);
    if(indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"eye.jpg"];
    }
    if(indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"stomach.jpg"];
    }
    if(indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"outo.jpg"];
    }
    if(indexPath.row == 3){
        cell.imageView.image = [UIImage imageNamed:@"cold.jpg"];
    }
    if(indexPath.row == 4){
        cell.imageView.image = [UIImage imageNamed:@"injury.jpg"];
    }
    if(indexPath.row == 5){
        cell.imageView.image = [UIImage imageNamed:@"hospital_uketsuke.jpg"];
    }
    if(indexPath.row == 6){
        cell.imageView.image = [UIImage imageNamed:@"hospital004.jpg"];

    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray[indexPath.row]];
    
    
    // For even
    if (indexPath.row % 2 == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray[indexPath.row]];
        cell.backgroundColor = [UIColor colorWithHue:0.45
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:0.6];     // does not work
        
        // does not work
    }
    // For odd
    else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray[indexPath.row]];
        cell.backgroundColor = [UIColor colorWithHue:0.1
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:0.7];     // does not work
    }
    
    return cell;

}

//行が押されたときに反応
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"行番号 = %ld",indexPath.row);
    
    //遷移(せんい)先画面のカプセル化(インスタンス化)
    //（移動した先の画面を実体化、指定できるよにした）
    vocabularyViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"vocabularyViewController"];
    
    //押された番号を遷移先画面のプロパティにセット
    //int型に変換する (int)indexPath.row
    //帰れない型だとエラーが出る
    dvc.selectNum = (int)indexPath.row;
    
    //ナビゲーションコントローラーの機能で画面遷移
    //右側からくる動作がアニメーション：YESでアニメーション使用 NO:で使用しない
    [[self navigationController] pushViewController:dvc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}


@end
