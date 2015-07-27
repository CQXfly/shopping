//
//  QXCategoryCell.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXCategoryCell : UITableViewCell

@property (nonatomic ,weak) NSString *categoryText;
@property (nonatomic ,weak) UILabel *category;
@property (nonatomic ,weak) UIView *viewShow1;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
