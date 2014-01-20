//
//  BaseShotCell_Private.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "BaseShotCell.h"

@interface BaseShotCell ()

@property (nonatomic, strong) UIImageView *shotImageView;
@property (nonatomic, strong) UILabel *shotTitle;

- (void)createShotImageView;
- (void)createShotTileLabel;

- (void)labelFrameRecounter;
- (void)imageFrameRecounter;

@end
