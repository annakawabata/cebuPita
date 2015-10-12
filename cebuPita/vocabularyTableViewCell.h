//
//  vocabularyTableViewCell.h
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/04.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vocabularyTableViewCell : UITableViewCell{
    NSArray *_vocabularyArray1;
    NSArray *_vocabularyArray2;
    NSArray *_vocabularyArray3;
    NSArray *_vocabularyArray4;
    NSArray *_vocabularyArray5;
    NSArray *_vocabularyArray6;
    NSArray *_areaList;
}

@property (weak, nonatomic) IBOutlet UITextView *vocabularyText;

@end
