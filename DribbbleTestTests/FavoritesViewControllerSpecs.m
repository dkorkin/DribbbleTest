//
//  FavoritesViewControllerSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/13/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "Kiwi.h"
#import "FavoritesViewController.h"
#import "FavoritesViewController_Private.h"

SPEC_BEGIN(FavoritesViewControllerSpecs)

describe(@"ShotViewController initialize", ^{
    __block FavoritesViewController *_favoritesViewController;
    
    beforeAll(^{
        _favoritesViewController = [FavoritesViewController new];
        [_favoritesViewController redrawTable];
    });
    
    afterAll(^{
        _favoritesViewController = nil;
    });
    
    describe(@"delete shot cell delegate", ^{
        context(@"delete shot cell", ^{
            it(@"vc should confirm the protocol", ^{
                [[_favoritesViewController should] conformToProtocol:@protocol(DeleteShotCellDelegate)];
            });
            it(@"delegete method should be implemented", ^{
                NSNumber *actionMethod = @([_favoritesViewController respondsToSelector:@selector(deletePressed:)]);
                [[actionMethod should] beTrue];
            });
        });
    });
    
});

SPEC_END
