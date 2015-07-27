//
//  QXCategoryCell.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXCategoryCell.h"
#import "const.h"

@implementation QXCategoryCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        
        UILabel *category = [[UILabel alloc]initWithFrame:(CGRect){0,0,75,50}];
        [self.contentView addSubview:category];
        _category=category;
        
        UIView *viewShow = [[UIView alloc]initWithFrame:(CGRect){0,49.5,75,0.5}];
        viewShow.backgroundColor = [UIColor blackColor];
        viewShow.alpha=0.4;
        [self.contentView addSubview:viewShow];
        UIView *viewShow1 = [[UIView alloc]initWithFrame:(CGRect){0,0,2,50}];
        viewShow1.backgroundColor = UIColorRGBA(255, 127, 0, 1);
        [self.contentView addSubview:viewShow1];
        
        viewShow1.hidden = YES;
        
        
        _viewShow1 = viewShow1;
    }
    return self;
}

-(void)setCategoryText:(NSString *)categoryText
{
    _category.text = categoryText;
    _category.textAlignment = NSTextAlignmentCenter;
    _category.font = Font(16);
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"QXCategoryCell";
    QXCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QXCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //取消选中状态
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}

@end
