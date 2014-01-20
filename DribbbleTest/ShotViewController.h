//
//  ShotViewController.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarShotCell.h"

@interface ShotViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, StarShotCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
