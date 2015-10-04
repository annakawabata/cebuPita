//
//  DetailTableViewCell.h
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/04.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_vocabularyArray;
}
@property (weak, nonatomic) IBOutlet UILabel *vocabularyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vocabularyImage;

@end
