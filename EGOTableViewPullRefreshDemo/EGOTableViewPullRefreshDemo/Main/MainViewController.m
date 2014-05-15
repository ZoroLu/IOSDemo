//
//  MainViewController.m
//  EGOTableViewPullRefreshDemo
//
//  Created by LGQ on 14-4-27.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize array = _array;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.title = @"Pull Refresh Demo";
    _refreshTimes = 0;
    if (!_egoRefreshTableView) {
        EGORefreshTableHeaderView *refreshView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
        refreshView.delegate = self;
        [self.tableView addSubview:refreshView];
        _egoRefreshTableView = refreshView;
    }
    [self refreshLoadingData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"TableViewCellIndentifier";
//  register class and create a cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//   you can create a cell by this without register class
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSLog([NSString stringWithFormat:@"RELOAD:%d",_refreshTimes]);
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}

//- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return [NSString stringWithFormat:@"Header:%d",section];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
 *method for refresh to loading data and finish load data
 */
- (void)refreshLoadingData{
    _loading = YES;
//    loading data by backgroud thread
    _refreshTimes++;
    [NSThread detachNewThreadSelector:@selector(loadingDataInBackgroud) toTarget:self withObject:nil];
}

- (void)finishLoadedData{
    _loading = NO;
    [_egoRefreshTableView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    //refresh tableview data
    [self.tableView reloadData];
}

/*
 *delegate for scroll view
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_egoRefreshTableView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [_egoRefreshTableView egoRefreshScrollViewDidEndDragging:scrollView];
}

/*
 *  method for the protocol of EGORefreshTableHeaderDelegate
 */
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view{
    [self refreshLoadingData];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view{
    return _loading;
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view{
    return [NSDate date];
}

- (void)loadingDataInBackgroud{
    NSString* a = [NSString stringWithFormat:@"a:%d",_refreshTimes];
    NSString* b = [NSString stringWithFormat:@"b:%d",_refreshTimes];
    NSString* c = [NSString stringWithFormat:@"c:%d",_refreshTimes];
    NSString* d = [NSString stringWithFormat:@"d:%d",_refreshTimes];
    NSString* e = [NSString stringWithFormat:@"e:%d",_refreshTimes];
    NSArray* newArray = [NSArray arrayWithObjects:a,b,c,d,e, nil];
    _array = newArray;
    [NSThread sleepForTimeInterval:3];
    //refresh ui when finish loading in backgroud
    [self performSelectorOnMainThread:@selector(finishLoadedData) withObject:nil waitUntilDone:YES];
    
}

@end
