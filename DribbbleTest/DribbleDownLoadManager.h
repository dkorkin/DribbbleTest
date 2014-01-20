//
//  DribbleDownLoadManager.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/13/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DribbleDownLoadManager : NSObject

+ (instancetype)sharedInstance;
- (void)requestForShotsFromPages:(NSArray *)pages;

- (void)testRequest;

@end
