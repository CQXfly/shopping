//
//  QXShoppingVewControllerViewController.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXShoppingVewController.h"
#import "const.h"

@interface QXShoppingVewController ()  <QXCategoryTableViewDelegate,QXDetailDelegate,QXShoppingCarModalViewDelegate>

/**
 *  分类tableview
 */
@property (nonatomic,strong) QXCategoryTableView *categoryTableView;

/**
 *  详细tableview
 */
@property (nonatomic,strong) QXDetailView *detailTableView;

@property (nonatomic,strong) NSMutableArray *categoryArray;

@property (nonatomic,strong) NSMutableArray *offsArray;

@property (nonatomic,strong) NSMutableArray *tapLabelBlockArray;

/**
 *  总价
 */
@property (nonatomic,weak) UILabel *totalPrice;

/**
 *  底部label
 */
@property (nonatomic,strong) QXLabel *bottomLabel;

/**
 *  数量
 */
@property (nonatomic,assign) NSInteger quantityInt;

/**
 *  <#Description#>
 */
@property (nonatomic,strong) NSMutableDictionary *dic;

@property (nonatomic,strong) NSMutableArray *key;

//红色的原点
@property (nonatomic,weak) UILabel *totalSingular;

@property (nonatomic,weak) QXImageView *cartImage;
@end

@implementation QXShoppingVewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航控制器的标题
    UILabel *titleLabel =[[UILabel alloc]init];
    titleLabel.text =@"酒水超市";
    titleLabel.font =Font(18);
    titleLabel.frame =(CGRect){0,0,100,44};
    titleLabel.textColor = UIColorRGBA(255, 127, 0, 1);
    titleLabel.textAlignment=NSTextAlignmentCenter;
    self.title = titleLabel.text;
    self.navigationItem.titleView = titleLabel;
    
    //添加分类table
    CGFloat categoryViewWidth = 75;
    QXCategoryTableView *categoryView = [[QXCategoryTableView alloc] initWithFrame:(CGRect){0,0,categoryViewWidth,kWindowHeight-50}];
    categoryView.rowHeight = 50;
    categoryView.catDelegate = self;
    categoryView.backgroundColor = UIColorRGBA(238, 238, 238, 1);
    [categoryView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:categoryView];
    self.categoryTableView = categoryView;
    
    
    //添加详情的tableview
    QXDetailView *detailTableView = [[QXDetailView alloc]initWithFrame:(CGRect){categoryViewWidth,64,kWindowWidth-categoryViewWidth,kWindowHeight-50}];
    detailTableView.rowHeight = 90;
    detailTableView.deDelegate = self;
    detailTableView.backgroundColor = UIColorRGBA(238, 238, 238, 1);
    [detailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:detailTableView];
    self.detailTableView = detailTableView;


    self.reservationsVCDic = [@{@"name":@"散台",@"priceInt":@2300} mutableCopy];
    
    
    //设置数据源 好傻逼的感觉 -。-  没时间写plist 闲丑自己写个吧
    self.categoryArray =[NSMutableArray array];
    for ( int i=0; i<7; i++) {
        if (i==0) {
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            
            NSMutableArray *array =[NSMutableArray array];
            
            
            
            for (int i=0; i<7; i++) {
                if (i==0) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"1.jpg",@"name":@"德国OETTINGER奥丁格大麦啤酒500ml*4罐/组",@"money":@"39",@"OriginalPrice":@"56",@"Quantity":@"0",@"ProductID":@"q",@"Discount":@"7折"} mutableCopy];
                    [array addObject:dic1];
                }
                if (i==1) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"2.jpg",@"name":@"德拉克（Durlacher） 黑啤酒 330ml*6听",@"money":@"40",@"OriginalPrice":@"67",@"Quantity":@"0",@"ProductID":@"w",@"Discount":@"6折"} mutableCopy];
                    [array addObject:dic1];
                }
                if (i==2) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"3.jpg",@"name":@"奥塔利金爵 啤酒500ml*12 匈牙利原装低度进口啤酒酒水饮品",@"money":@"109",@"OriginalPrice":@"218",@"Quantity":@"0",@"ProductID":@"e",@"Discount":@"5折"} mutableCopy];
                    [array addObject:dic1];
                }
                if (i==3) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"4.jpg",@"name":@"德国啤酒 原装进口啤酒 flensburger/弗伦斯堡啤酒 土豪金啤 5L 桶装啤酒",@"money":@"158",@"OriginalPrice":@"226",@"Quantity":@"0",@"ProductID":@"r",@"Discount":@"7折"} mutableCopy];
                    [array addObject:dic1];
                }
                if (i==4) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"5.jpg",@"name":@"青岛啤酒 经典 醇厚 啤酒500ml*12听/箱 国产 整箱",@"money":@"66",@"OriginalPrice":@"110",@"Quantity":@"0",@"ProductID":@"t",@"Discount":@"6折"} mutableCopy];
                    [array addObject:dic1];
                }
                if (i==5) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"6.jpg",@"name":@"京姿 百威罐装330ml*24 啤酒",@"money":@"140",@"OriginalPrice":@"200",@"Quantity":@"0",@"ProductID":@"y",@"Discount":@"7折"} mutableCopy];
                    [array addObject:dic1];
                }
                if (i==6) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"7.jpg",@"name":@"德国OETTINGER奥丁格自然浑浊型小麦啤酒500ml*4罐/组",@"money":@"58",@"OriginalPrice":@"129",@"Quantity":@"0",@"ProductID":@"u",@"Discount":@"4.5折"} mutableCopy];
                    [array addObject:dic1];
                }
                
                
            }
            dic =[@{@"dockName":@"啤酒",@"right":array} mutableCopy];
            [self.categoryArray addObject:dic];
            
        }
        if (i==1) {
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            
            NSMutableArray *array =[NSMutableArray array];
            
            
            
            for (int i=0; i<8; i++) {
                if (i==0) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"8.jpg",@"name":@"Martell马爹利名士1000ML 进口洋酒 名仕干邑白兰地1L",@"money":@"695",@"Quantity":@"0",@"ProductID":@"a"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==1) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"9.jpg",@"name":@"奥美加银龙舌兰【OLMECA TEQUILA】38% 750ml",@"money":@"108",@"Quantity":@"0",@"ProductID":@"s"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==2) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"10.jpg",@"name":@"人头马天醇XO特优香槟干邑白兰地700ml",@"money":@"1386",@"Quantity":@"0",@"ProductID":@"d"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==3) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"11.jpg",@"name":@"40°法国马爹利蓝带干邑白兰地700ml",@"money":@"1080",@"Quantity":@"0",@"ProductID":@"f"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==4) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"12.jpg",@"name":@"沙皇伏特加塞珞700ml限量版",@"money":@"598",@"Quantity":@"0",@"ProductID":@"g"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==5) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"13.jpg",@"name":@"百加得黑朗姆酒 烈酒 750ml",@"money":@"92",@"Quantity":@"0",@"ProductID":@"h"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==6) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"14.jpg",@"name":@"Seagrams Gin 750ML 40度",@"money":@"99",@"Quantity":@"0",@"ProductID":@"j"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==7) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"15.jpg",@"name":@"马爹利蓝带干邑白兰地 700ml",@"money":@"1060",@"Quantity":@"0",@"ProductID":@"k"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                
                
            }
            dic =[@{@"dockName":@"洋酒",@"right":array} mutableCopy];
            [self.categoryArray addObject:dic];
            
        }
        if (i==2) {
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            
            NSMutableArray *array =[NSMutableArray array];
            
            
            
            for (int i=0; i<8; i++) {
                if (i==0) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"16.jpg",@"name":@"张裕解百纳干红葡萄酒双支礼盒 750ml*2",@"money":@"158",@"Quantity":@"0",@"ProductID":@"z"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==1) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"17.jpg",@"name":@"爱之湾+兰贵人组合",@"money":@"1230",@"Quantity":@"0",@"ProductID":@"x"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==2) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"18.jpg",@"name":@"菲卡珍藏莎当妮葡萄酒750ml",@"money":@"138",@"Quantity":@"0",@"ProductID":@"c"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==3) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"19.jpg",@"name":@"拉图嘉利庄园干红葡萄酒",@"money":@"1580",@"Quantity":@"0",@"ProductID":@"v"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==4) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"20.jpg",@"name":@"报恩城堡干红葡萄酒 六支装",@"money":@"1890",@"Quantity":@"0",@"ProductID":@"b"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==5) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"21.jpg",@"name":@"豪克玛歌庄园干红葡萄酒 750ml 1支装",@"money":@"2360",@"Quantity":@"0",@"ProductID":@"h"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==6) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"22.jpg",@"name":@"白浪莎庄园干红葡萄酒 750ml",@"money":@"98",@"Quantity":@"0",@"ProductID":@"n"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==7) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"23.jpg",@"name":@"布兰多庄园干红葡萄酒 750ml 1支装",@"money":@"36900",@"Quantity":@"0",@"ProductID":@"m"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                
                
            }
            dic =[@{@"dockName":@"红酒",@"right":array} mutableCopy];
            [self.categoryArray addObject:dic];
            
        }
        if (i==3) {
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            
            NSMutableArray *array =[NSMutableArray array];
            
            for (int i=0; i<8; i++) {
                if (i==0) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"24.jpg",@"name":@"白俄罗斯鸡尾酒",@"money":@"238",@"Quantity":@"0",@"ProductID":@"zq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==1) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"25.jpg",@"name":@"莫吉托",@"money":@"233",@"Quantity":@"0",@"ProductID":@"xq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==2) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"26.jpg",@"name":@"绝对柚惑",@"money":@"115",@"Quantity":@"0",@"ProductID":@"cq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==3) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"27.jpg",@"name":@"马蒂尼里",@"money":@"1580",@"Quantity":@"0",@"ProductID":@"vq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==4) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"28.jpg",@"name":@"绝对甜蜜",@"money":@"138",@"Quantity":@"0",@"ProductID":@"bq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==5) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"29.jpg",@"name":@"精致女士",@"money":@"138",@"Quantity":@"0",@"ProductID":@"hq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==6) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"30.jpg",@"name":@"绝对柠檬",@"money":@"138",@"Quantity":@"0",@"ProductID":@"nq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                if (i==7) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"31.jpg",@"name":@"绝对野趣",@"money":@"138",@"Quantity":@"0",@"ProductID":@"mq"} mutableCopy];
                    [array addObject:dic1]; ;
                }
                
                
            }            dic =[@{@"dockName":@"特色酒",@"right":array} mutableCopy];
            [self.categoryArray addObject:dic];
        }
        
        if (i==4) {
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            
            NSMutableArray *array =[NSMutableArray array];
            
            for (int i=0; i<2; i++) {
                if (i==0) {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"32.jpg",@"name":@"苹果、火龙果、西瓜、哈密瓜、杨桃（大）",@"money":@"89",@"Quantity":@"0",@"ProductID":@"ww"} mutableCopy];
                    [array addObject:dic1];
                }
                if(i==1)
                {
                    NSMutableDictionary *dic1 =[NSMutableDictionary dictionary];
                    dic1=[@{@"image":@"32.jpg",@"name":@"苹果、火龙果、西瓜、哈密瓜、杨桃（小）",@"money":@"89",@"Quantity":@"0",@"ProductID":@"wwe"} mutableCopy];
                    [array addObject:dic1];
                }
            }
            dic =[@{@"dockName":@"果盘",@"right":array} mutableCopy];
            [self.categoryArray addObject:dic];
            
        }
        categoryView.categoryArray = self.categoryArray;
        
        [categoryView reloadData];

    }
    
    self.offsArray = [NSMutableArray array];
    
    for (int i = 0; i< self.categoryArray.count;i ++)
    {
        CGPoint point = CGPointMake(0, 0);
        
        [self.offsArray addObject:NSStringFromCGPoint(point)];
    }
    
#warning  添加底部的购物车view
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, kWindowHeight - 50, kWindowWidth, 50)];
    bottomView.backgroundColor = UIColorRGBA(29, 29, 29, 1);
    [self.view addSubview:bottomView];
    
    /**
     通过NSNumberFormatter，可以设置NSNumber输出的格式。例如如下代码：
     
     NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
     
     formatter.numberStyle = NSNumberFormatterDecimalStyle;
     
     NSString *string = [formatter stringFromNumber:[NSNumber numberWithInt:123456789]];
     
     NSLog(@"Formatted number string:%@",string);
     
     输出结果为：[1223:403] Formatted number string:123,456,789
     
     
     其中NSNumberFormatter类有个属性numberStyle，它是一个枚举型，设置不同的值可以输出不同的数字格式。该枚举包括：
     
     
     
     enum {
     
     NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
     
     NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
     
     NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
     
     NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
     
     NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
     
     NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle
     
     y
     
     NSNumberFormatterRoundCeiling = kCFNumberFormatterRoundCeiling,//四舍五入，原值2.7999999999,直接输出3
     NSNumberFormatterRoundFloor = kCFNumberFormatterRoundFloor,//保留小数输出2.8 正是想要的
     NSNumberFormatterRoundDown = kCFNumberFormatterRoundDown,//加上了人民币标志，原值输出￥2.8
     NSNumberFormatterRoundUp = kCFNumberFormatterRoundUp,//本身数值乘以100后用百分号表示,输出280%
     NSNumberFormatterRoundHalfEven = kCFNumberFormatterRoundHalfEven,//原值表示，输出2.799999999E0
     NSNumberFormatterRoundHalfDown = kCFNumberFormatterRoundHalfDown,//原值的中文表示，输出二点七九九九。。。。
     NSNumberFormatterRoundHalfUp = kCFNumberFormatterRoundHalfUp //原值中文表示，输出第三
     
     
     
     };
     
     typedef NSUInteger NSNumberFormatterStyle;
     
     各个枚举对应输出数字格式的效果如下：
     
     
     
     [1243:403] Formatted number string:123456789
     
     
     
     [1243:403] Formatted number string:123,456,789
     
     
     
     [1243:403] Formatted number string:￥123,456,789.00
     
     
     
     [1243:403] Formatted number string:-539,222,988%
     
     
     
     [1243:403] Formatted number string:1.23456789E8
     
     
     
     [1243:403] Formatted number string:一亿二千三百四十五万六千七百八十九
     
     其中第三项和最后一项的输出会根据系统设置的语言区域的不同而不同
     */
    NSNumberFormatter *fomatter = [[NSNumberFormatter alloc] init];
    fomatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString * str = [fomatter stringFromNumber:[NSNumber numberWithDouble:[self.reservationsVCDic[@"priceInt"] integerValue]]];
    NSString *bottomLabelText = [NSString stringWithFormat:@"还差%@元",str];
    CGSize bottomLabelSize = [bottomLabelText sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:Font(15),NSFontAttributeName, nil]];
    
    QXLabel *bottomLabel = [[QXLabel alloc]initWithFrame:CGRectMake(kWindowWidth-(bottomLabelSize.width +20)-10,50/2-35/2,  bottomLabelSize.width +20, 35)];
    bottomLabel.text=bottomLabelText;
    bottomLabel.textColor=[UIColor whiteColor];
    bottomLabel.textAlignment=NSTextAlignmentCenter;
    bottomLabel.font=Font(15);
    bottomLabel.backgroundColor=[UIColor lightGrayColor];
    bottomLabel.layer.masksToBounds=YES;
    bottomLabel.layer.cornerRadius=6;
    bottomLabel.layer.borderWidth = 1;
    bottomLabel.userInteractionEnabled=NO;
    [bottomLabel addTarget:self action:@selector(bottomLabelClick) forControlEvents:QXLabelControlEventTap];
    bottomLabel.layer.borderColor = [[UIColor whiteColor] CGColor];
    [bottomView addSubview:bottomLabel];
    self.bottomLabel = bottomLabel;
    
    
    QXImageView *cartImage =[[QXImageView alloc]initWithFrame:(CGRect){10,5,40,40}];
    cartImage.image=[UIImage imageNamed:@"Home_Cart.jpg"];
    [cartImage addTarget:self action:@selector(cartImageClick) forControlEvents:QXImageViewControlEventTap];
    cartImage.userInteractionEnabled=YES;
    [bottomView addSubview:cartImage];
    _cartImage=cartImage;
    _quantityInt=0;
    
    UILabel *totalPrice =[[UILabel alloc]initWithFrame:(CGRect){CGRectGetMaxX(cartImage.frame)+20,50/2-16/2,200,16}];
    
    totalPrice.text=@"￥0";
    totalPrice.textColor=[UIColor whiteColor];
    totalPrice.font=Font(16);
    [bottomView addSubview:totalPrice];
    self.totalPrice=totalPrice;
    
    UILabel *totalSingular =[[UILabel alloc]initWithFrame:(CGRect){35,5,15,15}];
    
    totalSingular.text=@"";
    totalSingular.hidden=YES;
    totalSingular.layer.masksToBounds=YES;
    totalSingular.layer.cornerRadius=7.5;
    totalSingular.textAlignment=NSTextAlignmentCenter;
    totalSingular.backgroundColor=[UIColor redColor];
    totalSingular.textColor=[UIColor whiteColor];
    totalSingular.font=Font(13);
    [bottomView addSubview:totalSingular];
    self.totalSingular=totalSingular;
    
    self.dic=[NSMutableDictionary dictionary];
    self.key=[NSMutableArray array];
                            
    
}

- (void) bottomLabelClick
{
    
}


- (void) quantity:(NSInteger) quantity  money:(NSInteger)money key:(NSString *)key
{
    //需要加的钱
    NSInteger addend = quantity * money;
    QXLog(@"666666666666666666666     %zd",addend);
#warning 总价的计算
    [self.dic setObject:[NSString stringWithFormat:@"%ld",addend] forKey:key];
    
    //得到词典中所有的key值
    NSEnumerator * enumeratorKey = [self.dic keyEnumerator];
#warning 小红点
    NSInteger total = 0;
    NSInteger totalSingularInt= 0 ;
    for (NSObject *object in enumeratorKey) {
        
        total += [self.dic[object] integerValue];
        
        if ([self.dic[object] integerValue] != 0) {
            
            totalSingularInt +=1;
            self.totalSingular.hidden=NO;
        }
        
    }
    if (totalSingularInt == 0) {
        self.totalSingular.hidden = YES;
    }
    
    //总价少于需要
    if (total < [self.reservationsVCDic[@"priceInt"] integerValue]) {
        //让label为灰色
        _bottomLabel.backgroundColor=[UIColor lightGrayColor];
        _bottomLabel.userInteractionEnabled=NO;
        NSNumberFormatter *formatter =[[NSNumberFormatter alloc]init];
        formatter.numberStyle=NSNumberFormatterDecimalStyle;
        NSString *bottomLabelText =[NSString stringWithFormat:@"还差%@元",[formatter stringFromNumber:[NSNumber numberWithDouble:[_reservationsVCDic[@"priceInt"] integerValue]-total]]];
        _bottomLabel.text=bottomLabelText;

    } else
    {
        _bottomLabel.backgroundColor = [UIColor clearColor];
        _bottomLabel.userInteractionEnabled = YES;
        _bottomLabel.text = @"傻逼 赶紧付钱啊";
        
    }
    
    self.totalSingular.text = [NSString stringWithFormat:@"%ld",totalSingularInt];
//    CGRect frm = self.totalSingular.frame;
//    QXLog(@"self.totalo %@",self.totalSingular);
//    PPDragDropBadgeView *view = [[PPDragDropBadgeView alloc] initWithFrame:frm dragdropCompletion:^{
//        
//        QXLog(@"1111111111");
//        
//    }];
//    view.text = self.totalSingular.text;
//    self.totalSingular = view;
    self.totalSingular.backgroundColor = [UIColor greenColor];
    
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    self.totalPrice.text = [NSString stringWithFormat:@"￥%@",[formatter stringFromNumber:[NSNumber numberWithDouble:total]]];
    
#warning  让detailView刷新?
    [self.detailTableView reloadData];
    
    
}

#pragma mark -点击分类
- (void)category:(QXCategoryTableView *)categoryView ClickindexPathRow:(NSMutableArray *)array index:(NSIndexPath *)index indexPath:(NSIndexPath *)indexPath
{
    
    
    [self.detailTableView setContentOffset:self.detailTableView .contentOffset animated:NO];
    _offsArray[index.row] = NSStringFromCGPoint(self.detailTableView .contentOffset);
    
    self.detailTableView.detailArray = array;
    
    [self.detailTableView reloadData];
    CGPoint point = CGPointFromString([_offsArray objectAtIndex:indexPath.row]);
    [self.detailTableView setContentOffset:point];
    
}

-(void)cartImageClick
{
    NSMutableArray *dicArray = [NSMutableArray array];
    for (int i =0; i < self.categoryTableView.categoryArray.count; i ++) {
        
        NSMutableArray *array = self.categoryTableView.categoryArray[i][@"right"];
        
        for (int k = 0; k < array.count ;k ++) {
            
            NSMutableDictionary *dic = array[k];
            
            if ([dic[@"Quantity"] integerValue] != 0) {
                
                [dicArray addObject:dic];
                
                QXLog(@"%@   %ld",dic[@"name"],[dic[@"Quantity"] integerValue]);
            }
        }
        
    }
    
    if ([dicArray count] == 0) {
        
        return;
    } else
    {
        
        QXShoppingCarModalView *view = [[QXShoppingCarModalView alloc] init];
        view.TableOfContentsDelegate = self;
        __weak typeof(self) weakSelf =self;
        view.TableOfContentsBlock=^{
            [weakSelf.detailTableView reloadData];
        };
        view.tapLabelBlock=^(NSMutableArray *array){
            //删除字典所有对象
            [_dic removeAllObjects];
            _totalSingular.text=[NSString stringWithFormat:@"%@",@"0"];
            _totalPrice.text=[NSString stringWithFormat:@"￥%@",@"0"];
            _totalSingular.hidden=YES;
            
            for (int i=0; i<[_categoryArray count]; i++) {
                NSMutableArray *arrayDock =_categoryArray[i][@"right"];
                for (int k=0; k<[arrayDock count]; k++) {
                    if ([arrayDock[k][@"Quantity"] isEqualToString:@"0"] ) {
                        
                    }else
                    {
                        arrayDock[k][@"Quantity"] =@"0";
                    }
                }
                
            }
            _bottomLabel.backgroundColor=[UIColor lightGrayColor];
            _bottomLabel.userInteractionEnabled=NO;
            NSNumberFormatter *formatter =[[NSNumberFormatter alloc]init];
            formatter.numberStyle=NSNumberFormatterDecimalStyle;
            NSString *bottomLabelText =[NSString stringWithFormat:@"还差%@元",[formatter stringFromNumber:[NSNumber numberWithDouble:[_reservationsVCDic[@"priceInt"] integerValue]]]];
            _bottomLabel.text=bottomLabelText;
            [self.detailTableView reloadData];
            
        };
        [view modal:view array:dicArray];
    }


    
    
    
}


@end
