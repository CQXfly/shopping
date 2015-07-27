//
//  QXDetailView.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QXDetailView;

@protocol QXDetailDelegate <UITableViewDelegate>

@optional
-(void)quantity:(NSInteger)quantity money:(NSInteger)money key:(NSString *)key;

@end

@interface QXDetailView : UITableView

/**
 *  数据源
 */
@property (nonatomic,strong) NSMutableArray *detailArray;

@property (nonatomic,weak) id <QXDetailDelegate> deDelegate;

@end
