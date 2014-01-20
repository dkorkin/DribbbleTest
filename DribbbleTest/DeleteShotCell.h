//
//  DeleteShotCell.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/29/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "BaseShotCell.h"

@class DeleteShotCell;

@protocol DeleteShotCellDelegate <NSObject>

- (void)deletePressed:(DeleteShotCell *)cell;

@end

@interface DeleteShotCell : BaseShotCell

@property (nonatomic, weak) id<DeleteShotCellDelegate> delegate;

@end
