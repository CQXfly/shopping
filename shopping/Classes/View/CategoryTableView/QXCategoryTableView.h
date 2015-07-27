//
//  QXCategoryTableView.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QXCategoryTableView;

@protocol QXCategoryTableViewDelegate <UITableViewDelegate>

-(void)category:(QXCategoryTableView *)categoryView ClickindexPathRow:(NSMutableArray *)row  index:(NSIndexPath *)index indexPath:(NSIndexPath *)indexPath;


@end


@interface QXCategoryTableView : UITableView


/**
 *  数据源
 */
@property (nonatomic ,strong) NSMutableArray *categoryArray;


@property (weak ,nonatomic) id <QXCategoryTableViewDelegate> catDelegate;

@end
