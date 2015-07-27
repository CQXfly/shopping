//
//  QXShoppingCarModalView.h
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol QXShoppingCarModalViewDelegate <NSObject>

@optional

/**
 *  代理 让控制器完成计算 
 *
 *  @param quantity <#quantity description#>
 *  @param money    <#money description#>
 *  @param key      <#key description#>
 */
-(void)quantity:(NSInteger)quantity money:(NSInteger)money key:(NSString *)key;

@end



@interface QXShoppingCarModalView : UIView

@property (nonatomic ,weak) id<QXShoppingCarModalViewDelegate>TableOfContentsDelegate;
@property (nonatomic , copy) void (^TableOfContentsBlock)();
@property (nonatomic , copy) void (^tapLabelBlock)(NSMutableArray *array);

-(void)modal:(UIView *)cview array:(NSMutableArray *)array;

@end
