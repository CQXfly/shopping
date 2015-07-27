//
//  QXShoppingCarModalView.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXShoppingCarModalView.h"
#import "const.h"

CGFloat const kFadeInAnimationDuration = 0.6;
CGFloat const kTransformPart1AnimationDuration = 0.2;
CGFloat const kTransformPart2AnimationDuration = 0.1;
@interface QXShoppingCarModalView ()

@property (strong, nonatomic) UIWindow *window;
@property (weak ,nonatomic) UIView *cview;
@property (strong, nonatomic) QXShoppingCarViewController *viewController;

@end
@implementation QXShoppingCarModalView

- (void)modal:(UIView *)cview array:(NSMutableArray *)array
{
    _cview = cview;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.window.opaque = NO;
    
    self.viewController = [[QXShoppingCarViewController alloc] init];
    self.viewController.array=array;
    self.window.rootViewController = self.viewController;
    
    __weak typeof(self) weakSelf =self;
    self.viewController.TableOfContentsBlock=^{
        [weakSelf cancel];
    };
    self.viewController.topLabelBlock=^(NSMutableArray *array){
        [weakSelf cancel];
        weakSelf.tapLabelBlock(array);
    };
    self.viewController.TapActionBlock=^(NSInteger pageIndex ,NSInteger money ,NSString *key){
        if ([weakSelf.TableOfContentsDelegate respondsToSelector:@selector(quantity:money:key:)]) {
            [weakSelf.TableOfContentsDelegate quantity:pageIndex money:money key:key];
        }
    };
    [self.viewController.view addSubview:_cview];
    
    
    
    [self.window setHidden:NO];
}

-(void)cancel
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.viewController.view.alpha = 1;
        _cview.alpha = 1;
        
        [UIView animateWithDuration:kFadeInAnimationDuration animations:^{
            self.viewController.view.alpha = 0;
            _cview.alpha = 0;
            self.viewController.topView.frame=(CGRect){0,kWindowHeight,kWindowWidth,0};
        }completion:^(BOOL finished)
         {
             [self cleanup];
         }];
        
    });
    
}
-(void)cleanup
{
    _TableOfContentsBlock();
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self.window removeFromSuperview];
    self.window=nil;
}

@end
