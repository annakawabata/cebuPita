//
//  customCell.h
//  cebuPita
//
//  Created by 川端杏奈 on 2015/09/25.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface customCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;
@property (weak, nonatomic) IBOutlet UITextView *hospitalTextView;
@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;

@end
