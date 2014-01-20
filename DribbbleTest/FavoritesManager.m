//
//  FavoritesManager.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/27/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "FavoritesManager.h"
#import "GCDSingleton.h"
#import "Shot.h"
#import "DataBaseManager.h"

NSString *const kFavoritesKey = @"kFavoritesKey";

@implementation FavoritesManager

static FavoritesManager *_sharedInstance = nil;

+ (instancetype)sharedInstance {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

+ (void)setSharedInstance:(FavoritesManager *)instance {
    _sharedInstance = instance;
}

- (NSArray *)favorites {
    //return [[NSUserDefaults standardUserDefaults] objectForKey:kFavoritesKey];
    NSMutableArray *shotIds = [NSMutableArray new];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isInFavorites == YES"];
    NSArray *favorites = [Shot findAllWithPredicate:predicate];
    for(Shot *shot in favorites) {
        [shotIds addObject:shot.shotId];
    }
    return shotIds;
}

- (BOOL)isShotIdInFavorites:(NSNumber *)shotID {
    /* Realization With UserDefaults
     NSArray *favoriteList = [[NSUserDefaults standardUserDefaults] objectForKey:kFavoritesKey];
     return[favoriteList containsObject:shotID];
     */
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isInFavorites == YES and shotId = %@", shotID];
    Shot *shot = [Shot findFirstWithPredicate:predicate];
    return (shot) ? YES : NO;
}

- (void)addToFavoritesShotWithID:(NSNumber *)shotID {
    /* Realization With UserDefaults
     NSMutableArray *shots = [[NSMutableArray alloc] initWithArray:
     [[NSUserDefaults standardUserDefaults] objectForKey:kFavoritesKey]];
     [shots addObject:shotID];
     [[NSUserDefaults standardUserDefaults] setObject:shots forKey:kFavoritesKey];
     [[NSUserDefaults standardUserDefaults] synchronize];
     */
    
    Shot *shot = [[DataBaseManager sharedInstance] shotById:shotID];
    shot.isInFavorites = @YES;
    [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
}

- (void)removeFromFavoritesShotWithID:(NSNumber *)shotID {
    /* Realization With UserDefaults
     NSMutableArray *shots = [[NSMutableArray alloc] initWithArray:
     [[NSUserDefaults standardUserDefaults] objectForKey:kFavoritesKey]];
     [shots removeObject:shotID];
     [[NSUserDefaults standardUserDefaults] setObject:shots forKey:kFavoritesKey];
     [[NSUserDefaults standardUserDefaults] synchronize];
     */
    
    Shot *shot = [[DataBaseManager sharedInstance] shotById:shotID];
    shot.isInFavorites = @NO;
    [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
}

@end
