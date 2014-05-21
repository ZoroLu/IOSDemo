//
//  OneSectionDataSource.m
//  ReuseUITableViewDataSource
//
//  Created by LGQ on 14-5-21.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "OneSectionDataSource.h"

@implementation OneSectionDataSource

-(id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return [self.items objectAtIndex:indexPath.row];
}

-(id)initWithItems:(NSArray *)items cellConfigure:(TableViewCellConfigureBlock)configure cellReuseIdentifier:(NSString *)identifier{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
        [self.items addObjectsFromArray:items];
        self.tableViewCellConfigureBlock = [configure copy];
        self.reuseIdentifier = identifier;
        return self;
    }
    return nil;
}

//UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    self.tableViewCellConfigureBlock(cell,[self itemAtIndexPath:indexPath]);
    return cell;
}

@end
