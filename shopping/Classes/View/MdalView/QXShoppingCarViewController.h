//
//  QXShoppingCarViewController.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXShoppingCarViewController : UIViewController

/**
 *  数据源 
 */
@property (strong ,nonatomic) NSMutableArray *array;
@property (strong ,nonatomic) UIView *topView;
@property (nonatomic , copy) void (^TableOfContentsBlock)();
@property (nonatomic , copy) void (^topLabelBlock)(NSMutableArray *array);
@property (nonatomic , copy) void (^TapActionBlock)(NSInteger pageIndex ,NSInteger money ,NSString *key);

@end
