//
//  QXLabel.m
//  QXShoppingChoose
//
//  Created by 崇庆旭 on 15/7/27.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "QXLabel.h"
#import "const.h"

@interface QXLabel ()

@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic,assign) id tapTarget;
@property (nonatomic,assign) SEL tapAction;

@property (nonatomic,strong) UILongPressGestureRecognizer *longGesture;
@property (nonatomic,assign) id longPressBeganTarget;
@property (nonatomic,assign) SEL longPressBeganAction;
@property (nonatomic,assign) id longPressEndTarget;
@property (nonatomic,assign) SEL longPressEndAction;


@end


@implementation QXLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


- (void)addTarget:(id)target action:(SEL)action forControlEvents:(QXLabelControlEvents)controlEvents
{
    @synchronized(self)
    {
        if (controlEvents == QXLabelControlEventTap) {
            
            if (self.tapGesture == nil) {
                
                self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
                [self addGestureRecognizer:self.tapGesture];
            }
            
            self.tapTarget = target;
            self.tapAction = action;
            
        } else if (controlEvents == QXLabelControlEventLongPressBegan)
        {
            if (self.longGesture == nil) {
                
                self.longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
                [self addGestureRecognizer:self.longGesture];
                
            }
            
            self.longPressBeganTarget = target;
            self.longPressBeganAction = action;
        } else if (controlEvents == QXLabelControlEventLongPressEnd)
        {
            if (self.longGesture == nil) {
                self.longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
                [self addGestureRecognizer:self.longGesture];
            }
            
            self.longPressEndTarget = target;
            self.longPressEndAction = action;
            }
    
    }
}

- (void)tapGesture:(UITapGestureRecognizer *)gesture{
    if (gesture.state ==  UIGestureRecognizerStateBegan) {
        
    }else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state ==UIGestureRecognizerStateFailed || gesture.state == UIGestureRecognizerStateCancelled) {
        if (self.tapTarget && self.tapAction) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            [self.tapTarget  performSelector:self.tapAction withObject:self];
            
#pragma clang diagnostic pop
        }
    }
}

- (void)longPressGesture:(UILongPressGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (self.longPressBeganTarget && self.longPressBeganAction) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            [self.longPressBeganTarget performSelector:self.longPressBeganAction withObject:self];
            
#pragma clang diagnostic pop
        }
    }else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state ==UIGestureRecognizerStateFailed || gesture.state == UIGestureRecognizerStateCancelled) {
        if (self.longPressEndTarget && self.longPressEndAction) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            [self.longPressEndTarget performSelector:self.longPressEndAction withObject:self];
            
#pragma clang diagnostic pop
        }
    }
}

@end
