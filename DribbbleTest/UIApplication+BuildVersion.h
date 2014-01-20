//
//  UIApplication+BuildVersion.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (BuildVersion)

+ (NSString *)versionBuild;
+ (NSString *)getBuildDate;

@end
