//
//  ShotViewControllerSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/13/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "Kiwi.h"
#import "ShotViewController.h"
#import "ShotViewController_Private.h"

SPEC_BEGIN(ShotViewControllerSpecs)

describe(@"ShotViewController initialize", ^{
    __block ShotViewController *_shotsViewController;
    
    beforeAll(^{
        _shotsViewController = [ShotViewController new];
        [_shotsViewController loadView];
        
    });
    
    afterAll(^{
        _shotsViewController = nil;
    });
    
    describe(@"shots", ^{
        context(@"shots are loaded", ^{
            it(@"it should not be nil", ^{
                [_shotsViewController.shots shouldNotBeNil];
            });
        });
    });
    
    describe(@"star shot cell delegate", ^{
        context(@"star shot cell", ^{
            it(@"vc should confirm the protocol", ^{
                [[_shotsViewController should] conformToProtocol:@protocol(StarShotCellDelegate)];
            });
            it(@"delegete method should be implemented", ^{
                NSNumber *actionMethod = @([_shotsViewController respondsToSelector:@selector(starPressed:)]);
                [[actionMethod should] beTrue];
            });
        });
    });
    
});

SPEC_END