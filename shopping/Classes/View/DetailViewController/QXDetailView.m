//
//  QXDetailView.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXDetailView.h"
#import "const.h"



@interface QXDetailView () <UITableViewDataSource,UITableViewDelegate>


@end
@implementation QXDetailView 
-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        
        
    }
    
    return self;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QXLog(@"detailView %zd",self.detailArray.count);
    return _detailArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QXDetailCell *cell =[QXDetailCell cellWithTableView:tableView];
    cell.TapActionBlock=^(NSInteger pageIndex ,NSInteger money,NSString *key){
        if ([self.deDelegate respondsToSelector:@selector(quantity:money:key:)]) {
            [self.deDelegate quantity:pageIndex money:money key:key];
            
            
            QXLog(@"derail的代理");
        }
        
    };
    
    
    
    cell.backgroundColor=UIColorRGBA(246, 246, 246, 1);
    cell.rightData=self.detailArray[indexPath.row];
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
