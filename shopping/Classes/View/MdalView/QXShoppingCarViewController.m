//
//  QXShoppingCarViewController.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXShoppingCarViewController.h"
#import "const.h"



@interface QXShoppingCarViewController ()<UITableViewDelegate,UIAlertViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView *TableOfContentsTableView;
@end

@implementation QXShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button =[[UIButton alloc]initWithFrame:self.view.bounds];
    button.backgroundColor = [UIColor blackColor];
    button.alpha=0.3;
    [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)setArray:(NSMutableArray *)array
{
    _array =array;
    CGFloat H =[_array count]*50;
    if (H >kWindowHeight/2) {
        H =kWindowHeight/2;
    }
    //这里作为tableView顶部的多余空间显示
    UIView *topView =[[UIView alloc]initWithFrame:(CGRect){0,kWindowHeight-50,kWindowWidth,30+H}];
    topView.backgroundColor=[UIColor whiteColor];
    QXLabel *topLabel =[[QXLabel alloc]initWithFrame:(CGRect){kWindowWidth-80-10,30/2-20/2,80,20}];
    topLabel.text=@"清空购物车";
    topLabel.textAlignment=NSTextAlignmentCenter;
    topLabel.userInteractionEnabled=YES;
    topLabel.layer.masksToBounds=YES;
    topLabel.layer.cornerRadius=6;
    topLabel.font=Font(14);
    topLabel.textColor=[UIColor redColor];
    topLabel.layer.borderWidth = 1;
    topLabel.layer.borderColor = [[UIColor redColor] CGColor];
    [topLabel addTarget:self action:@selector(topLabelClick) forControlEvents:QXLabelControlEventTap];
    
    [topView addSubview:topLabel];
    
    UITableView *TableOfContentsTableView =[[UITableView alloc]initWithFrame:(CGRect){0,30,kWindowWidth,0}];
    TableOfContentsTableView.delegate = self;
    TableOfContentsTableView.dataSource = self;
    TableOfContentsTableView.rowHeight=50;
    [topView addSubview:TableOfContentsTableView];
    [self.view addSubview:topView];
    _topView=topView;
    self.TableOfContentsTableView=TableOfContentsTableView;
    TableOfContentsTableView.alpha=0;
    topView.alpha=0;
    [UIView animateWithDuration:0.3 animations:^{
        TableOfContentsTableView.alpha=1;
        topView.alpha=1;
        topView.frame=(CGRect){0,kWindowHeight-50-H-30,kWindowHeight,30+H};
        TableOfContentsTableView.frame =(CGRect){0,30,kWindowHeight,H};
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QXShoppingCarCell *cell =[QXShoppingCarCell cellWithTableView:tableView];
    cell.TapActionBlock=^(NSInteger pageIndex ,NSInteger money,NSString *key){
        _TapActionBlock(pageIndex,money,key);
    };
    cell.reloadDataBlock=^(NSString *key){
        if([_array count] !=0)
        {
            for (int i=0; i<[_array count]; i++) {
                if ([_array[i][@"ProductID"] isEqualToString:key]) {
                    [_array removeObjectAtIndex:i];
                    if ([_array count]==0) {
                        _TableOfContentsBlock();
                        return ;
                    }
                    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
                    CGFloat H =[_array count]*50;
                    if (H >kWindowHeight/2) {
                        H =kWindowHeight/2;
                    }
                    [_TableOfContentsTableView beginUpdates];
                    [_TableOfContentsTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                    [_TableOfContentsTableView endUpdates];
                    
                    [UIView animateWithDuration:0.3 animations:^{
                        //调整删除cell后的整体尺寸
                        _topView.frame=(CGRect){0,kWindowHeight-50-H-30,kWindowHeight,30+H};
                        
                        
                        _TableOfContentsTableView.frame =(CGRect){0,30,kWindowHeight,H};
                    }completion:^(BOOL finished) {
                        
                    }];
                    
                }
            }
        }else
        {
            _TableOfContentsBlock();
        }
    };
    cell.dicData=_array[indexPath.row];
    return cell;
}

-(void)cancel
{
    _TableOfContentsBlock();
}

-(void)topLabelClick
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确定要清空购物车吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"确定"];
    [alert show];
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        _topLabelBlock(_array);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
