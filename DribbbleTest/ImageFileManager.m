//
//  ImageFileManager.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/30/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "ImageFileManager.h"

@implementation ImageFileManager

+ (BOOL)checkImageForExist:(NSString *)imageName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:imageName];
    return [fileManager fileExistsAtPath:path];
}

+ (void)saveImage:(UIImage *)image withName:(NSString *)fileName {
    if (image != nil) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent:fileName];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
}

+ (UIImage *)loadImageWithName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
