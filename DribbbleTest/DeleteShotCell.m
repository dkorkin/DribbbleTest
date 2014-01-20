//
//  DeleteShotCell.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/29/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "DeleteShotCell.h"

#define BUTTON_SIZE 44

@interface DeleteShotCell ()

@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation DeleteShotCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self createDeleteButton];
    }
    return  self;
}

- (void)createDeleteButton {
    UIImage *deleteImageNormal = [UIImage imageNamed:@"delete"];
    CGRect deleteFrame = CGRectMake(self.contentView.frame.size.width - BUTTON_SIZE,
                                    0,
                                    BUTTON_SIZE,
                                    BUTTON_SIZE);
    _deleteButton = [[UIButton alloc] initWithFrame:deleteFrame];
    [_deleteButton setImage:deleteImageNormal forState:UIControlStateNormal];
    [_deleteButton addTarget:self action:@selector(deletePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_deleteButton];
}

- (void)deletePressed {
    [self.delegate deletePressed:self];
}

@end
