//
//  MainViewController.h
//  ReuseUITableViewDataSource
//
//  Created by LGQ on 14-5-20.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (retain, nonatomic) NSMutableArray* dataArray;

@end
