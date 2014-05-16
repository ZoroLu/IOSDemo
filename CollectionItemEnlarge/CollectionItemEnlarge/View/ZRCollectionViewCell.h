//
//  ZRCollectionViewCell.h
//  CollectionItemEnlarge
//
//  Created by LGQ on 14-5-15.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* ZRCollectionViewCellIdentify = @"ZRCollectionViewCellIdentify";

@interface ZRCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelCoontent;
@property (copy, nonatomic) NSString* content;

- (void) showContent;

@end
