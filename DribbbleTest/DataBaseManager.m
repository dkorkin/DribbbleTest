//
//  DataBaseManager.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/9/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "DataBaseManager.h"
#import "GCDSingleton.h"
#import "PListManager.h"
#import "OldShot.h"


@implementation DataBaseManager

static DataBaseManager *_sharedInstance = nil;

+ (instancetype)sharedInstance {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

+ (void)setSharedInstance:(DataBaseManager *)instance {
    _sharedInstance = instance;
}

- (NSArray *)shotsArrayFromDataBase {
    NSArray *shots = [Shot findAllSortedBy:@"shotId" ascending:YES];
    return shots;
}

- (Shot *)shotById:(NSNumber *)shotId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"shotId == %@", shotId];
    return [Shot findFirstWithPredicate:predicate];
}


#pragma mark -
#pragma mark - fill data base

- (void) fillDataBaseFromPlist:(NSString *) plistName {
    NSArray *shots = [[PListManager sharedInstance] shotsArrayFromPlist:plistName];
    for(OldShot *oShot in shots) {
        Shot *newShot = [Shot MR_createEntity];
        newShot.shotId = oShot.shotId;
        newShot.title = oShot.title;
        newShot.imageName = oShot.imageName;
    }
    [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
}

@end