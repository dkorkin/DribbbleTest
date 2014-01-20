//
//  StarShotCell.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "BaseShotCell.h"

@class StarShotCell;

@protocol StarShotCellDelegate <NSObject>

-(void) starPressed:(StarShotCell *)cell;

@end

@interface StarShotCell : BaseShotCell

@property (assign, nonatomic) BOOL isInFavorite;
@property (nonatomic, weak) id<StarShotCellDelegate> delegate;

@end
