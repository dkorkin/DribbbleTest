//
//  FavoritesViewController.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeleteShotCell.h"

@interface FavoritesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, DeleteShotCellDelegate>

@property (weak, nonatomic) IBOutlet UILabel *noShotLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
