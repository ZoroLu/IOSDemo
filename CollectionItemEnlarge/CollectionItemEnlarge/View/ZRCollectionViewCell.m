//
//  ZRCollectionViewCell.m
//  CollectionItemEnlarge
//
//  Created by LGQ on 14-5-15.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "ZRCollectionViewCell.h"

@implementation ZRCollectionViewCell

@synthesize content;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray* arrayOfViews = [[NSBundle mainBundle]loadNibNamed:@"ZRCollectionViewCell" owner:self options:nil];
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

- (void)showContent{
    if (content) {
        _labelCoontent.text = content;
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
