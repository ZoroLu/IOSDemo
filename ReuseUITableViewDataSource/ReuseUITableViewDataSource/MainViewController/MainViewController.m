//
//  MainViewController.m
//  ReuseUITableViewDataSource
//
//特别注意，尝试一晚上，一个下午，失败，最后发现失败原因是OneSectionDataSource 定义为局部变量，现在定义为似有变量。
//
//  Created by LGQ on 14-5-21.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "MainViewController.h"
#import "OneSectionDataSource.h"

@interface MainViewController ()

@property (strong, nonatomic) OneSectionDataSource* dataSource;

@end

static NSString* ReuseIdentifier = @"UITableViewCellIdentifier";

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
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"我爱这个世界。",@"我不是为了输赢，我只是认真。",@"天生骄傲。", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
    
    TableViewCellConfigureBlock configureBlock = ^(UITableViewCell * cell, NSString * item){
        cell.textLabel.text = item;
    };
     self.dataSource = [[OneSectionDataSource alloc] initWithItems:self.dataArray cellConfigure:configureBlock cellReuseIdentifier:ReuseIdentifier];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
