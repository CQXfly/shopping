//
//  const.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#ifndef QXShoppingChoose_const_h
#define QXShoppingChoose_const_h


#import "QXShoppingVewController.h"
#import "QXDetailCell.h"
#import "QXDetailView.h"
#import "QXCategoryCell.h"
#import "QXCategoryTableView.h"
#import "QXLabel.h"
#import "QXImageView.h"
#import "QXShoppingCarViewController.h"
#import "QXShoppingCarModalView.h"
#import "QXShoppingCarCell.h"
#import "QXShoppingCarModalView.h"
#import "PPDragDropBadgeView.h"



#define QXRandomColor  QXColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define Font(F) [UIFont systemFontOfSize:(F)]

#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define kWindowWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define kWindowHeight                       ([[UIScreen mainScreen] bounds].size.height)


//配置日志形式
#ifdef DEBUG // 处于开发阶段
#define QXLog(...) NSLog(@"%s \n Line:%d\n %@ \n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else // 处于发布阶段
#define QXLog(...)
#endif
#endif
