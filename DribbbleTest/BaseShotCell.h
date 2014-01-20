//
//  BaseShotCell.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"

FOUNDATION_EXPORT CGFloat const kShotImageTopAndBottomMargin;
FOUNDATION_EXPORT CGFloat const kShotImageLeftMargin;
FOUNDATION_EXPORT CGFloat const kShotLabelLeftPadding;
FOUNDATION_EXPORT CGFloat const kShotImageWidth;
FOUNDATION_EXPORT CGFloat const kShotImageHeight;
FOUNDATION_EXPORT CGFloat const kShotTitleWidth;


@interface BaseShotCell : UITableViewCell

@property (nonatomic, strong) Shot *shot;

- (void)redraw;

+ (CGFloat)cellHeightFromShot:(Shot *)shot;

@end
