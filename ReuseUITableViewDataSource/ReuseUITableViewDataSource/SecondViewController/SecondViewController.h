//
//  SecondViewController.h
//  ReuseUITableViewDataSource
//
//  Created by LGQ on 14-5-21.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSMutableArray* items;

@end
