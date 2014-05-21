//
//  OneSectionDataSource.h
//  ReuseUITableViewDataSource
//
//  Created by LGQ on 14-5-21.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock) (id cell, id item);

@interface OneSectionDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, copy) NSString* reuseIdentifier;
@property (nonatomic, retain) NSMutableArray* items;
@property (nonatomic, copy) TableViewCellConfigureBlock tableViewCellConfigureBlock;

- (id)itemAtIndexPath : (NSIndexPath *)indexPath;
- (id)initWithItems : (NSArray *)items cellConfigure : (TableViewCellConfigureBlock)configure cellReuseIdentifier : (NSString *)identifier;

@end
