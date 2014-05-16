//
//  MainViewController.h
//  CollectionItemEnlarge
//
//  Created by LGQ on 14-5-15.
//  Copyright (c) 2014年 LGQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (retain, nonatomic) NSMutableArray* dataArray;

- (void)initData;

@end

