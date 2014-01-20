//
//  DataBaseManager.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/9/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shot.h"

@interface DataBaseManager : NSObject

+ (instancetype)sharedInstance;

- (Shot *)shotById:(NSNumber *)shotId;
- (NSArray *)shotsArrayFromDataBase;
- (void) fillDataBaseFromPlist:(NSString *) plistName;

@end