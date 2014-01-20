//
//  FavoritesViewController.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "FavoritesViewController.h"
#import "FavoritesManager.h"
#import "DeleteShotCell.h"
#import "PListManager.h"
#import "DataBaseManager.h"

CGFloat const kStatusBarHeight = 20;


@interface FavoritesViewController ()

@property (nonatomic, strong) NSArray *shotIds;

@end

@implementation FavoritesViewController

#pragma mark -
#pragma mark - view life cycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self redrawTable];
}


#pragma mark -
#pragma mark - table view reload

- (void)redrawTable {
    self.shotIds = [[FavoritesManager sharedInstance] favorites];
    [self.tableView reloadData];
    [self tableViewResizer];
    
    if([_shotIds count] == 0) {
        self.tableView.hidden = YES;
        self.noShotLabel.hidden = NO;
    }
    else {
        self.tableView.hidden = NO;
        self.noShotLabel.hidden = YES;
    }
}

- (void)tableViewResizer {
    CGFloat maxHeigth = self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height - kStatusBarHeight;
    CGFloat allCellHeight = [self tableHeightCounter];
    CGRect tableFrame = self.tableView.frame;
    if(maxHeigth < allCellHeight) {
        tableFrame.size.height = maxHeigth;
        self.tableView.scrollEnabled = YES;
    }
    else {
        tableFrame.size.height = allCellHeight;
        self.tableView.scrollEnabled = NO;
    }
    self.tableView.frame = tableFrame;
}

- (CGFloat)tableHeightCounter {
    CGFloat resultHeigth = 0;
    for(NSNumber *shotId in _shotIds) {
        //OldShot *shot = [[PListManager sharedInstance] shotById:shotId];
        Shot *shot = [[DataBaseManager sharedInstance] shotById:shotId];
        resultHeigth += [DeleteShotCell cellHeightFromShot:shot];
    }
    return resultHeigth;
}


#pragma mark -
#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_shotIds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *shotFavoriteCellIden = @"ShotFavoriteCellIden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shotFavoriteCellIden];
    if (!cell) {
        cell = [[DeleteShotCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:shotFavoriteCellIden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSNumber *shotId = [_shotIds objectAtIndex:indexPath.row];
    //OldShot *shot = [[PListManager sharedInstance] shotById:shotId];
    Shot *shot = [[DataBaseManager sharedInstance] shotById:shotId];
    
    DeleteShotCell *shotCell = (DeleteShotCell *) cell;
    shotCell.shot = shot;
    shotCell.delegate = self;
    [shotCell redraw];
    
    return cell;
}


#pragma mark -
#pragma mark - table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //OldShot *shot = [[PListManager sharedInstance] shotById:[_shotIds objectAtIndex:indexPath.row]];
    NSNumber *shotId = [_shotIds objectAtIndex:indexPath.row];
    Shot *shot = [[DataBaseManager sharedInstance] shotById:shotId];
    
    return [DeleteShotCell cellHeightFromShot:shot];
}


#pragma mark -
#pragma mark - deleteCell Delegate

- (void)deletePressed:(DeleteShotCell *)cell {
    Shot *shotToRemove = cell.shot;
    [[FavoritesManager sharedInstance] removeFromFavoritesShotWithID:shotToRemove.shotId];
    [self redrawTable];
}

@end
