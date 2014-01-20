//
//  ShotClass.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "OldShot.h"

@implementation OldShot

- (instancetype)initWithShotID:(NSNumber *)shotID imageName:(NSString *)imageName shotTitle:(NSString *)title {
    self = [super init];
    if(self) {
        self.shotId = shotID;
        self.imageName = imageName;
        self.title = title;
    }
    return self;
}

@end
