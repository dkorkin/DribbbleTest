//
//  FavoritesManager.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const kFavoritesKey;

@interface FavoritesManager : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)favorites;
- (BOOL)isShotIdInFavorites:(NSNumber *)shotID;
- (void)addToFavoritesShotWithID:(NSNumber *)shotID;
- (void)removeFromFavoritesShotWithID:(NSNumber *)shotID;

@end
