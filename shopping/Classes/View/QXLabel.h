//
//  QXLabel.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>

// 购物栏的邮编label 计算总价

typedef NS_ENUM(NSInteger, QXLabelControlEvents) {
    QXLabelControlEventTap,
    QXLabelControlEventLongPressBegan,
    QXLabelControlEventLongPressEnd,
};

@interface QXLabel : UILabel

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(QXLabelControlEvents)controlEvents;

@end
