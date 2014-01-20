//
//  PListManager.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "PListManager.h"
#import "GCDSingleton.h"

#define SHOT_ID_KEY @"shotID"
#define SHOT_IMAGENAME_KEY @"shotImageName"
#define SHOT_TITLE_KEY @"shotTitle"

@interface PListManager ()

@property (nonatomic, strong) NSArray *shots;

@end

@implementation PListManager

static PListManager *_sharedInstance = nil;

+ (instancetype)sharedInstance {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

+ (void)setSharedInstance:(PListManager *)instance {
    _sharedInstance = instance;
}

- (NSArray *)shotsArrayFromPlist:(NSString *)plistName {
    if(!_shots){
        NSMutableArray *shotClassList = [NSMutableArray new];
        NSArray *result = [self arrayFromPlist:plistName];
        for(NSDictionary* dictionary in result) {
            [shotClassList addObject:[self shotFromDictionary:dictionary]];
        }
        self.shots = [NSArray arrayWithArray:shotClassList];
    }
    return _shots;
}

- (NSArray *)arrayFromPlist:(NSString *)plistName {
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]];
    
}

- (OldShot *)shotFromDictionary:(NSDictionary *)dictionary {
    NSString *shotImageName = [self stringFromDictionary:dictionary forKey:SHOT_IMAGENAME_KEY];
    NSString *shotTitle = [self stringFromDictionary:dictionary forKey:SHOT_TITLE_KEY];
    NSNumber *shotID = [self numberFromDictionary:dictionary forKey:SHOT_ID_KEY];
    return [[OldShot alloc] initWithShotID:shotID imageName:shotImageName shotTitle:shotTitle];
}

- (NSNumber *)numberFromDictionary:(NSDictionary *)dictionary forKey:(NSString *)key {
    NSNumber *result;
    if([[dictionary objectForKey:key] isKindOfClass:[NSNumber class]]) {
        result = [dictionary objectForKey:key];
    }
    return result;
}

- (NSString *)stringFromDictionary:(NSDictionary *)dictionary forKey:(NSString *)key {
    NSString *result = nil;
    if([[dictionary objectForKey:key] isKindOfClass:[NSString class]]) {
        result = [dictionary objectForKey:key];
    }
    return result;
}


- (OldShot *)shotById:(NSNumber *)shotId {
    OldShot *shot = nil;
    if(_shots) {
        for (OldShot *tempShot in _shots) {
            if([tempShot.shotId isEqualToNumber:shotId]) {
                shot = tempShot;
                break;
            }
        }
    }
    return shot;
}


@end
