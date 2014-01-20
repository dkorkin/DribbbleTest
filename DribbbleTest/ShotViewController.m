//
//  ShotViewController.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "ShotViewController.h"
#import "PListManager.h"
#import "DataBaseManager.h"
#import "FavoritesManager.h"

NSString *const kShotsPlist = @"ShotsPList";

@interface ShotViewController () 

@property (nonatomic, strong) NSArray *shots;

@end

@implementation ShotViewController

-(id)init {
    self = [super init];
    if(self) {
        _shots = [[DataBaseManager sharedInstance] shotsArrayFromDataBase];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.shots = [[PListManager sharedInstance] shotsArrayFromPlist:kShotsPlist];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}


#pragma mark -
#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_shots count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [StarShotCell cellHeightFromShot: [_shots objectAtIndex:indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *shotCellIden = @"ShotCellIden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shotCellIden];
    if (!cell) {
        cell = [[StarShotCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:shotCellIden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Shot *shot = [_shots objectAtIndex:indexPath.row];
    BOOL isFavorite = [[FavoritesManager sharedInstance] isShotIdInFavorites:shot.shotId];
    
    StarShotCell *shotCell = (StarShotCell *) cell;
    shotCell.delegate = self;
    shotCell.shot = shot;
    shotCell.isInFavorite = isFavorite;
    [shotCell redraw];
    
    return cell;
}


#pragma mark -
#pragma mark - cell Delegate

- (void)starPressed:(StarShotCell *)cell {
    Shot *shot = cell.shot;
    BOOL isShotInFav = [[FavoritesManager sharedInstance] isShotIdInFavorites:shot.shotId];
    if(!isShotInFav) {
        [[FavoritesManager sharedInstance] addToFavoritesShotWithID:shot.shotId];
    }
    else {
        [[FavoritesManager sharedInstance] removeFromFavoritesShotWithID:shot.shotId];
    }
}


@end
