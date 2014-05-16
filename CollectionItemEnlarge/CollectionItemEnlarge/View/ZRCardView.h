//
//  ZRCardView.h
//  CollectionItemEnlarge
//
//  Created by LGQ on 14-5-16.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRCardView : UIView

@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (copy, nonatomic) NSString *content;

- (void)showContent;

@end
