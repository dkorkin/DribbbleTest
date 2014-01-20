//
//  BaseShotCell.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "BaseShotCell.h"
#import "ImageFileManager.h"
#import "UIImage+ScaleAndCrop.h"
#import <AFNetworking/UIImageView+AFNetworking.h>


CGFloat const kShotImageTopAndBottomMargin = 5;
CGFloat const kShotImageLeftMargin = 10;
CGFloat const kShotLabelLeftPadding = 90;
CGFloat const kShotImageWidth = 70;
CGFloat const kShotImageHeight = 60;
CGFloat const kShotTitleWidth = 200;

@interface BaseShotCell()

@property (nonatomic, strong) UIImageView *shotImageView;
@property (nonatomic, strong) UILabel *shotTitle;

@end

@implementation BaseShotCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createShotImageView];
        [self createShotTileLabel];
    }
    return self;
}


#pragma redraw section set cell parametrs and setup frames

- (void)redraw {
    _shotTitle.text = self.shot.title;
    
    [self labelFrameRecounter];
    [self imageFrameRecounter];
    
    [self makeImageForImageView];
}


#pragma mark -
#pragma mark - elements creation section

- (void)createShotImageView {
    _shotImageView = [UIImageView new];
    _shotImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_shotImageView];
}

- (void)createShotTileLabel {
    _shotTitle = [UILabel new];
    _shotTitle.numberOfLines = 0;
    _shotTitle.lineBreakMode = NSLineBreakByWordWrapping;
    _shotTitle.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:_shotTitle];
}


#pragma mark -
#pragma mark - frame recounters

- (void)labelFrameRecounter {
    NSDictionary *attributes = @{NSFontAttributeName : _shotTitle.font};
    
    CGSize textSize = CGSizeMake(kShotTitleWidth, MAXFLOAT);
    CGRect textNameRect = [_shotTitle.text boundingRectWithSize:textSize
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:attributes
                                                        context:nil];
    
    CGRect labelFrame = _shotTitle.frame;
    labelFrame.size = CGSizeMake(kShotTitleWidth, textNameRect.size.height);
    labelFrame.origin.x = kShotLabelLeftPadding;
    if(textNameRect.size.height > kShotImageWidth) {
        labelFrame.origin.y = kShotImageTopAndBottomMargin;
    }
    else {
        labelFrame.origin.y = [BaseShotCell cellHeightFromShot:self.shot]/2 - textNameRect.size.height/2;
    }
    _shotTitle.frame = labelFrame;
}

- (void)imageFrameRecounter {
    _shotImageView.frame = CGRectMake(kShotImageLeftMargin,
                                      kShotImageTopAndBottomMargin,
                                      kShotImageWidth,
                                      kShotImageHeight);
}


#pragma mark -
#pragma mark - set image to image view

- (void)makeImageForImageView {
    if(_shot.imageName.length > 0) {
        NSString *imagePreviewFilePath = [NSString stringWithFormat:@"preview_%@",_shot.imageName];
        BOOL isImageExists = [ImageFileManager checkImageForExist:imagePreviewFilePath];
        if (isImageExists) {
            UIImage *previewImage = [ImageFileManager loadImageWithName:imagePreviewFilePath];
            _shotImageView.image = previewImage;
        }
        else {
            dispatch_queue_t downloadQueue = dispatch_queue_create("load_shot_image", NULL);
            dispatch_async(downloadQueue, ^{
                UIImage *shotImage = [UIImage imageNamed:_shot.imageName];
                UIImage *cropedImage = [shotImage imageByScalingAndCroppingForSize:_shotImageView.frame.size];
                [ImageFileManager saveImage:cropedImage withName:imagePreviewFilePath];
                UIImage *previewImage = [ImageFileManager loadImageWithName:imagePreviewFilePath];
                dispatch_sync(dispatch_get_main_queue(), ^{
                    _shotImageView.image = previewImage;
                });
            });
        }
    }
    else {
        NSURL *imageUrl = [NSURL URLWithString:_shot.imageUrl];
        [_shotImageView setImageWithURL:imageUrl];
    }
}


+ (CGFloat)cellHeightFromShot:(Shot *)shot {
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0]};
    CGSize textSize = CGSizeMake(kShotTitleWidth, MAXFLOAT);
    CGRect textNameRect = [shot.title boundingRectWithSize:textSize
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
    
    if(textNameRect.size.height > kShotImageHeight) {
        return textNameRect.size.height + kShotImageTopAndBottomMargin * 2;
    }
    
    return kShotImageHeight + kShotImageTopAndBottomMargin * 2;
}

@end