//
//  UITableViewDataSource.m
//  ReuseUITableViewDataSource
//
//  Created by LGQ on 14-5-20.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "UITableViewDataSource.h"

@interface UITableViewDataSource ()

@property (retain, nonatomic) NSMutableArray* items;
@property (strong, nonatomic) TableViewConfigureCellBlock configureCellBlock;
@property (copy, nonatomic) NSString* cellIdentifier;

@end

@implementation UITableViewDataSource

- (id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier ConfigureCellBlock:(TableViewConfigureCellBlock)configureCellBlock{
    self = [super init];
    if (self) {
        _configureCellBlock = configureCellBlock;
        _cellIdentifier = cellIdentifier;
        _items = [[NSMutableArray alloc] init];
        [_items addObjectsFromArray:items];

    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return [_items objectAtIndex:indexPath.row];
}

- (void)addItems:(NSArray *)exItems{
    [_items addObjectsFromArray:exItems];
}

// UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    id item = [_items objectAtIndex:indexPath.row];
    _configureCellBlock(cell, item);
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}


@end
