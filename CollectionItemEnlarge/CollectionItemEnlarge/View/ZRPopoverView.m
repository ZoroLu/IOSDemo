//
//  ZRPopoverView.m
//  CollectionItemEnlarge
//
//  Created by LGQ on 14-5-15.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "ZRPopoverView.h"

@interface ZRPopoverView ()

@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, assign) CGRect boxFrame;

@end

@implementation ZRPopoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//show Popover At Point
+ (void)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)cView{
    ZRPopoverView *popView = [[ZRPopoverView alloc] initWithFrame:CGRectZero];
    [popView showPopoverAtPoint:point inView:view withContentView:cView];
}

- (void)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)cView{
    self.boxFrame = cView.frame;
    self.contentView = cView;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    UIView* topView = [[window subviews] objectAtIndex:0];
    CGPoint topPoint = [topView convertPoint:point fromView:view];
    CGRect topViewBounds = topView.bounds;
    _contentView.frame = _boxFrame;
    _contentView.hidden = NO;
    [self addSubview:_contentView];
    
    self.layer.anchorPoint = CGPointMake(topPoint.x / topViewBounds.size.width, topPoint.y / topViewBounds.size.height);
    self.frame = topViewBounds;
    [self setNeedsDisplay];
    
    [topView addSubview:self];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.f;
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

//show popover view at rect
+ (void)showPopoverAtRect:(CGRect)rect inView:(UIView *)view withContentView:(UIView *)cView{
    ZRPopoverView* popView = [[ZRPopoverView alloc] initWithFrame:CGRectZero];
    [popView showPopoverAtRect:rect inView:view withContentView:cView];
}


- (void)showPopoverAtRect:(CGRect)rect inView:(UIView *)view withContentView:(UIView *)cView{

    self.boxFrame = cView.frame;
    self.contentView = cView;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    UIView* topView = [[window subviews] objectAtIndex:0];
   
    CGRect topViewBounds = topView.bounds;
    _contentView.frame = _boxFrame;
    _contentView.hidden = NO;
    [self addSubview:_contentView];
    
    self.frame = topViewBounds;
    [self setNeedsDisplay];
    
    [topView addSubview:self];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    
    
    
}

- (void)drawRect:(CGRect)rect
{
    
}

//触摸事件
- (void)tapped : (UITapGestureRecognizer *)tap{
    [self dismiss];
}

//消失
- (void)dismiss{
    [UIView animateWithDuration:0.3f animations:^{
        //TODO: add dismiss animation
        self.alpha = 0.1f;
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

@end
