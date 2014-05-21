//
//  UITableViewDataSource.h
//  ReuseUITableViewDataSource
//
//  实现一个UITableViewDataSource的类，提取公用部分，增加复用率，减少ViewController 代码
//
//  Created by LGQ on 14-5-20.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <Foundation/Foundation.h>

//block to configure cell with item, implment in view controller
typedef void (^TableViewConfigureCellBlock) (id cell, id item);

@interface UITableViewDataSource : NSObject <UITableViewDataSource>

- (id) initWithItems : (NSArray *) items cellIdentifier : (NSString *)cellIdentifier ConfigureCellBlock : (TableViewConfigureCellBlock) configureCellBlock;

- (id) itemAtIndexPath : (NSIndexPath *)indexPath;

- (void)addItems : (NSArray *) exItems;

@end
