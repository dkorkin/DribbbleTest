//
//  ShotClass.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OldShot : NSObject

@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSNumber *shotId;

- (instancetype)initWithShotID:(NSNumber *)shotID imageName:(NSString *)imageName shotTitle:(NSString *) title;

@end
