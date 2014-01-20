//
//  ImageFileManager.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/30/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFileManager : NSObject

+ (BOOL)checkImageForExist:(NSString *)imageName;
+ (void)saveImage:(UIImage *)image withName:(NSString *)fileName;
+ (UIImage *)loadImageWithName:(NSString *)fileName;

@end
