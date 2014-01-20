//
//  StarShotCell.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "StarShotCell.h"

#define BUTTON_SIZE 44

@interface StarShotCell ()

@property (nonatomic, strong) UIButton *starButton;

@end

@implementation StarShotCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self createStarButton];
    }
    return  self;
}

- (void)createStarButton {
    UIImage *starImageNormal = [UIImage imageNamed:@"favorites-empty-icon"];
    UIImage *starImageSelected = [UIImage imageNamed:@"favorbutton-titlelogo-ontap"];
    _starButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - BUTTON_SIZE,
                                                            0,
                                                            BUTTON_SIZE,
                                                            BUTTON_SIZE)];
    [_starButton setImage:starImageNormal forState:UIControlStateNormal];
    [_starButton setImage:starImageSelected forState:UIControlStateHighlighted];
    [_starButton setImage:starImageSelected forState:UIControlStateHighlighted | UIControlStateSelected];
    [_starButton setImage:starImageSelected forState:UIControlStateSelected];
    
    [_starButton addTarget:self action:@selector(favPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_starButton];
    
}

- (void)redraw {
    [super redraw];
    if(self.isInFavorite) {
        _starButton.selected = YES;
    }
    else {
        _starButton.selected = NO;
    }
}



- (void)favPressed {
    _starButton.selected = !_starButton.selected;
    [self.delegate starPressed:self];
}

@end
