//
//  PlistManagerSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/10/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "Kiwi.h"
#import "PListManager.h"
#import "PListManager_Private.h"
#import "OldShot.h"

SPEC_BEGIN(PlistManagerSpecs)

describe(@"PlistManager Initialization", ^{
    
    __block NSArray *plistShots = nil;
    
    beforeAll(^{
        plistShots = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]
                                                       pathForResource:@"TestShotsPList"
                                                       ofType:@"plist"]];
    });
    
    context(@"When values from Plist are loaded shots list", ^{
        it(@"should not be nil", ^{
            [plistShots shouldNotBeNil];
        });
        it(@"should not be empty", ^{
            [[plistShots shouldNot] beEmpty];
        });
        it(@"should have 50 elements", ^{
            [[plistShots should] haveCountOf:50];
        });
    });
    
});

describe(@"PlistManager converting Dictionary to Shot", ^{
    context(@"when we have numbers in dictionary", ^{
        it(@"should return nil from empty dictionary", ^{
            NSDictionary *dict;
            [[[PListManager sharedInstance] numberFromDictionary:dict forKey:@"trash"] shouldBeNil];
        });
        it(@"should return NSNumber class", ^{
            NSDictionary *dict = @{@"key": @14};;
            [[[[PListManager sharedInstance] numberFromDictionary:dict forKey:@"key"] should]
             beKindOfClass:[NSNumber class]] ;
        });
        it(@"should return value which was given", ^{
            NSDictionary *dict = @{@"key": @15};;
            NSNumber *result = [[PListManager sharedInstance] numberFromDictionary:dict forKey:@"key"];
            [[theValue([result intValue]) should] equal:theValue(15)];
        });
    });
    
    context(@"when we have strings in dictionary", ^{
        it(@"should return nil from empty dictionary", ^{
            NSDictionary *dict;
            [[[PListManager sharedInstance] stringFromDictionary:dict forKey:@"trash"] shouldBeNil];
        });
        it(@"should return NSString class", ^{
            NSDictionary *dict = @{@"key": @"test"};
            [[[[PListManager sharedInstance] stringFromDictionary:dict forKey:@"key"] should]
             beKindOfClass:[NSString class]] ;
        });
        it(@"should return value which was given", ^{
            NSDictionary *dict = @{@"key": @"check value"};
            NSString *result = [[PListManager sharedInstance] stringFromDictionary:dict forKey:@"key"];
            [[theValue(result) should] equal:theValue(@"check value")];
        });
    });
    
});

describe(@"PlistManager converting Dictionary to Shot", ^{
    it(@"should return shot id", ^{
        NSDictionary *dict = @{@"shotID": @1};
        OldShot *shot = [[PListManager sharedInstance] shotFromDictionary:dict];
        [[theValue(shot.shotId) should] equal:theValue(@1)];
    });
    it(@"should return shot imageName", ^{
        NSDictionary *dict = @{@"shotImageName": @"0.jpg"};
        OldShot *shot = [[PListManager sharedInstance] shotFromDictionary:dict];
        [[theValue(shot.imageName) should] equal:theValue(@"0.jpg")];
    });
    it(@"should return shot title", ^{
        NSDictionary *dict = @{@"shotTitle": @"test"};
        OldShot *shot = [[PListManager sharedInstance] shotFromDictionary:dict];
        [[theValue(shot.title) should] equal:theValue(@"test")];
    });
    
});

describe(@"PlistManager search shot", ^{
    it(@"should return shot by id", ^{
        [[PListManager sharedInstance] shotsArrayFromPlist:@"TestShotsPList"];
        OldShot *shot = [[PListManager sharedInstance] shotById:@1];
        [[theValue(shot.shotId) should] equal:theValue(@1)];
    });
});

SPEC_END
