//
//  MainViewController.m
//  ReuseUITableViewDataSource
//
//  Created by LGQ on 14-5-20.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "MainViewController.h"
#import "UITableViewDataSource.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"我爱这个世界.",@"one",@"two",@"three",@"five",@"six",@"我不是为了输赢，我就是认真.", nil];
    
    void (^tableViewConfigureCellBlock)(UITableViewCell *, NSString *) = ^(UITableViewCell * cell, NSString *text){
        cell.textLabel.text = text;
    };
    UITableViewDataSource* dataSource = [[UITableViewDataSource alloc] initWithItems:_dataArray cellIdentifier:@"TableViewCellIdentifier" ConfigureCellBlock:tableViewConfigureCellBlock];
    self.tabelView.dataSource = dataSource;
    [_tabelView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
