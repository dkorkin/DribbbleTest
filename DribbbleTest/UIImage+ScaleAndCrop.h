//
//  UIImage+Crop.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/30/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Crop)

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
