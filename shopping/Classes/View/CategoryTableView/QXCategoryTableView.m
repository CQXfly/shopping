//
//  QXCategoryTableView.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXCategoryTableView.h"
#import "const.h"

@interface QXCategoryTableView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSIndexPath *path;

@property (nonatomic ,assign) BOOL is;

@end

@implementation QXCategoryTableView

-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        
        
        
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if(!_is)
    {
        NSInteger selectedIndex = 0;
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        [self tableView:self didSelectRowAtIndexPath:selectedIndexPath];
        _is=YES;
    }
}

-(void)setCategoryArray:(NSMutableArray *)categoryArray
{
    _categoryArray = categoryArray;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _categoryArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    QXCategoryCell *cell =[QXCategoryCell cellWithTableView:tableView];
    cell.categoryText=self.categoryArray[indexPath.row][@"dockName"];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}


//点击分类cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    QXLog(@"tableview category");
    
    if (_path!=nil) {
        QXCategoryCell *cell = (QXCategoryCell *)[tableView cellForRowAtIndexPath:_path];
        cell.backgroundColor = [UIColor whiteColor];
        cell.category.textColor = [UIColor blackColor];
        cell.viewShow1.hidden = YES;
    }
    if ([self.catDelegate respondsToSelector:@selector(category:ClickindexPathRow:index:indexPath:)]) {
        
        [self.catDelegate category:self ClickindexPathRow:self.categoryArray[indexPath.row][@"right"] index:self.path indexPath:indexPath];
        
    }
    //取消选中颜色
    QXCategoryCell *cell = (QXCategoryCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.category.textColor=UIColorRGBA(255, 127, 0, 1);
    cell.backgroundColor=UIColorRGBA(246, 246, 246, 1);
    cell.viewShow1.hidden=NO;
    _path=indexPath;
    
}




@end
