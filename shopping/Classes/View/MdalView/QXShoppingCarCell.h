//
//  QXShoppingCarCell.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXShoppingCarCell : UITableViewCell

@property (nonatomic ,strong) NSMutableDictionary *dicData;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic , copy) void (^TapActionBlock)(NSInteger pageIndex ,NSInteger money ,NSString *key);
@property (nonatomic , copy) void (^reloadDataBlock)(NSString *key);

@end
