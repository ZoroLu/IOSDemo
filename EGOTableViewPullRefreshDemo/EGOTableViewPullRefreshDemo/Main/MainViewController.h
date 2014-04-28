//
//  MainViewController.h
//  EGOTableViewPullRefreshDemo
//
//  Created by LGQ on 14-4-27.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface MainViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView* _egoRefreshTableView;
    BOOL _loading;
}

@property (retain,nonatomic)NSArray* array;
@property (assign,nonatomic)int refreshTimes;

- (void)refreshLoadingData;
- (void)finishLoadedData;
- (void)loadingDataInBackgroud;
@end
