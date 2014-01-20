//
//  UIApplication+BuildVersion.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "UIApplication+BuildVersion.h"

@implementation UIApplication (BuildVersion)

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)build {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
}

+ (NSString *)versionBuild {
    NSString *version = [self appVersion];
    NSString *build = [self build];
    NSString *versionBuild = [NSString stringWithFormat:@"v%@", version];
    
    if (![version isEqualToString: build]) {
        versionBuild = [NSString stringWithFormat:@"%@(%@)", versionBuild, build];
    }
    
    return versionBuild;
}

+ (NSString *)getBuildDate {
    NSString *dateStr = [NSString stringWithFormat:@"%@ %@", [NSString stringWithUTF8String:__DATE__], [NSString stringWithUTF8String:__TIME__]];
    
    return dateStr;
}

@end
