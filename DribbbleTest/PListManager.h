//
//  PListManager.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OldShot.h"

@interface PListManager : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)shotsArrayFromPlist:(NSString *)plistName;

- (OldShot *)shotById:(NSNumber *)shotId;

@end
