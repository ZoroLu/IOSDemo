//
//  ZRCardView.m
//  CollectionItemEnlarge
//
//  Created by LGQ on 14-5-16.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "ZRCardView.h"

@implementation ZRCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray* arrayViews = [[NSBundle mainBundle] loadNibNamed:@"ZRCardView" owner:self options:nil];
        if ([arrayViews count] < 1) {
            return nil;
        }
        if (![[arrayViews objectAtIndex:0] isKindOfClass:[UIView class]]) {
            return nil;
        }
        self = [arrayViews objectAtIndex:0];
    }
    return self;
}

- (void)showContent{
    if (_content) {
        _labelContent.text = _content;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
