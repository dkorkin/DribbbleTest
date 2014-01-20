//
//  PListManager_PListManager_Private.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "PListManager.h"

static PListManager *_sharedInstance;

@interface PListManager ()

+ (void)setSharedInstance:(PListManager *)instance;

- (NSArray *)arrayFromPlist:(NSString *)plistName;

- (OldShot *)shotFromDictionary:(NSDictionary *)dictionary;
- (NSNumber *)numberFromDictionary:(NSDictionary *)dictionary forKey:(NSString *)key;
- (NSString *)stringFromDictionary:(NSDictionary *)dictionary forKey:(NSString *)key;

@end
