//
//  ZRPopoverView.h
//  CollectionItemEnlarge
//
//  Created by LGQ on 14-5-15.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRPopoverView : UIView

+ (void)showPopoverAtPoint : (CGPoint)point inView : (UIView *)view withContentView : (UIView *)cView;
+ (void)showPopoverAtRect : (CGRect)rect inView : (UIView *)view withContentView : (UIView *) cView;

@end
