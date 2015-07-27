//
//  QXImageView.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>
//购物栏的图标
typedef NS_ENUM(NSInteger, QXImageViewControlEvents) {
    QXImageViewControlEventTap,
   QXImageViewControlEventLongPressBegan,
    QXImageViewControlEventLongPressEnd,
};
@interface QXImageView : UIImageView

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(QXImageViewControlEvents)controlEvents;

@end
