//
//  FavoritesManagerSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/9/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "Kiwi.h"
#import "FavoritesManager.h"

SPEC_BEGIN(FavoritesManagerSpecs)

describe(@"Favorites Manager CRD", ^{
    __block NSArray *favorites = nil;
    
    beforeAll(^{
        favorites = [[FavoritesManager sharedInstance] favorites];
        for(NSNumber *shotId in favorites) {
            [[FavoritesManager sharedInstance] removeFromFavoritesShotWithID:shotId];
        }
    });
    
    beforeEach(^{
        favorites = [[FavoritesManager sharedInstance] favorites];
    });
    
    afterAll(^{
        favorites = [[FavoritesManager sharedInstance] favorites];
        for(NSNumber *shotId in favorites) {
            [[FavoritesManager sharedInstance] removeFromFavoritesShotWithID:shotId];
        }
    });
    
    context(@"when favorites have no shots", ^{
        it(@"should be nil", ^{
            [favorites shouldNotBeNil];
        });
        it(@"favorites should be empty", ^{
            [[favorites should] beEmpty];
        });
    });
    
    context(@"when shot was added to favorites", ^{
        it(@"favorites should have count of 1", ^{
            [[FavoritesManager sharedInstance] addToFavoritesShotWithID:@5];
            favorites = [[FavoritesManager sharedInstance] favorites];
            [[favorites should] haveCountOf:1];
        });
        it(@"favorites should have added object", ^{
            [[favorites should] contain:@5];
        });
    });
    
    context(@"when shot was removed from favorites", ^{
        it(@"favorites should not have added object", ^{
            [[FavoritesManager sharedInstance] removeFromFavoritesShotWithID:@5];
            favorites = [[FavoritesManager sharedInstance] favorites];
            [[favorites shouldNot] contain:@5];
        });
        it(@"favorites should be empty", ^{
            favorites = [[FavoritesManager sharedInstance] favorites];
            [[favorites should] beEmpty];
        });
    });
    
});


SPEC_END
