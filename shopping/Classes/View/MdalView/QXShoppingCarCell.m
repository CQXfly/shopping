//
//  QXShoppingCarCell.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXShoppingCarCell.h"
#import "const.h"

@interface QXShoppingCarCell ()

@property (weak ,nonatomic) UILabel *highlights;

@property (weak ,nonatomic) UILabel *name;

@property (weak ,nonatomic) UILabel *money;

@property (weak ,nonatomic) UILabel *moneySub;

@property (weak ,nonatomic) UIButton *left;

@property (weak ,nonatomic) UIButton *right;

@property (weak ,nonatomic) UILabel *quantity;

@end

@implementation QXShoppingCarCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *highlights =[[UILabel alloc]init];
        [self.contentView addSubview:highlights];
        _highlights=highlights;
        
        UILabel *name =[[UILabel alloc]init];
        [self.contentView addSubview:name];
        _name=name;
        
        UILabel *money=[[UILabel alloc]init];
        [self.contentView addSubview:money];
        _money=money;
        
        UILabel *moneySub=[[UILabel alloc]init];
        [self.contentView addSubview:moneySub];
        _moneySub=moneySub;
        
        UIButton *left=[[UIButton alloc]init];
        [self.contentView addSubview:left];
        _left=left;
        
        UIButton *right=[[UIButton alloc]init];
        [self.contentView addSubview:right];
        _right=right;
        
        UILabel *quantity = [[UILabel alloc]init];
        [self.contentView addSubview:quantity];
        _quantity=quantity;
        
    }
    return self;
}


-(void)setDicData:(NSMutableDictionary *)dicData
{
    _dicData=dicData;
    
    NSNumberFormatter *formatter =[[NSNumberFormatter alloc]init];
    formatter.numberStyle=NSNumberFormatterDecimalStyle;
    
    _highlights.backgroundColor=UIColorRGBA(255, 127, 0, 1);
    _highlights.frame=(CGRect){10,50/2-5/2,5,5};
    _highlights.layer.masksToBounds=YES;
    _highlights.layer.cornerRadius=2.5;
    
    _name.text=dicData[@"name"];
    _name.frame=(CGRect){CGRectGetMaxX(_highlights.frame)+5,50/2-13/2,kWindowWidth*0.3,13};
    _name.font=Font(13);
    //    _name.backgroundColor=[UIColor blackColor];
    if (dicData[@"OriginalPrice"]==nil) {
        
        _money.frame=(CGRect){0,50/2-11/2,kWindowWidth,11};
        _moneySub.hidden=YES;
    }else
    {
        _money.frame=(CGRect){0,50*0.25,kWindowWidth,11};
        _moneySub.frame=(CGRect){0,CGRectGetMaxY(_money.frame)+3,kWindowWidth,11};
        _moneySub.hidden=NO;
        _moneySub.text=[NSString stringWithFormat:@"原价:%@",[formatter stringFromNumber:[NSNumber numberWithDouble:[dicData[@"OriginalPrice"] integerValue]]]];
        _moneySub.font=Font(11);
        _moneySub.textColor=[UIColor lightGrayColor];
        _moneySub.textAlignment=NSTextAlignmentCenter;
    }
    
    
    
    _money.text=[NSString stringWithFormat:@"￥%@",[formatter stringFromNumber:[NSNumber numberWithDouble:[dicData[@"money"] integerValue]]]];
    _money.font=Font(11);
    _money.textColor=[UIColor redColor];
    _money.textAlignment=NSTextAlignmentCenter;
    
    
    
    CGFloat btnW =25;
    //吧台加号
    _right.frame=(CGRect){kWindowWidth-10- btnW,12.5,btnW,btnW};
    _right.layer.masksToBounds=YES;
    _right.layer.cornerRadius=btnW/2;
    [_right setTitle:@"+" forState:UIControlStateNormal];
    [_right setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_right addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    _right.titleLabel.font=Font(13);
    _right.layer.borderWidth = 1;
    _right.layer.borderColor = [[UIColor redColor] CGColor];
    //吧台减号
    _left.frame=(CGRect){kWindowWidth -10 -btnW -btnW - btnW ,12.5,btnW,btnW};
    _left.layer.masksToBounds=YES;
    _left.layer.cornerRadius=btnW/2;
    [_left setTitle:@"-" forState:UIControlStateNormal];
    [_left setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_left addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    _left.titleLabel.font=Font(13);
    _left.layer.borderWidth = 1;
    _left.layer.borderColor = [[UIColor redColor] CGColor];
    
    CGFloat W =(kWindowWidth-10 -btnW)-CGRectGetMaxX(_left.frame);
    _quantity.frame=(CGRect){CGRectGetMaxX(_left.frame),12.5,W,btnW};
    _quantity.text=dicData[@"Quantity"];
    _quantity.textAlignment=NSTextAlignmentCenter;
    _quantity.font=Font(16);
    
}

-(void)rightClick
{
    int NumberInt =[_quantity.text intValue];
    if (NumberInt ==99) {
        return;
    }
    ++NumberInt;
    
    _quantity.text =[NSString stringWithFormat:@"%d",NumberInt];
    _dicData[@"Quantity"] = _quantity.text;
    _TapActionBlock([ _dicData[@"Quantity"] integerValue],[_dicData[@"money"] integerValue] ,_dicData[@"ProductID"]);
    
}

-(void)leftClick
{
    int NumberInt =[_quantity.text intValue];
    if (NumberInt ==0) {
        
        return;
    }
    --NumberInt;
    _quantity.text =[NSString stringWithFormat:@"%d",NumberInt];
    _dicData[@"Quantity"] = _quantity.text;
    if (NumberInt ==0) {
        _TapActionBlock([ _dicData[@"Quantity"] integerValue],[_dicData[@"money"] integerValue] ,_dicData[@"ProductID"]);
        
#warning 加上这一句如果购物目录为零，就会动画的下移，不需要就注释掉
        _reloadDataBlock(_dicData[@"ProductID"]);
        
        
        return;
    }
    _TapActionBlock([ _dicData[@"Quantity"] integerValue],[_dicData[@"money"] integerValue] ,_dicData[@"ProductID"]);
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"BARightCell";
    QXShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QXShoppingCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //取消选中状态
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}



@end
