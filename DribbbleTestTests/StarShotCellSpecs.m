//
//  StarShotCellSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/13/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "Kiwi.h"
#import "StarShotCell.h"
#import "StarShotCell_Private.h"

SPEC_BEGIN(StarShotCellSpecs)

describe(@"",^{
    __block StarShotCell *starShotCell = nil;
    
    beforeAll(^{
        starShotCell = [[StarShotCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DeleteShotCell"];
        [starShotCell redraw];
    });
    
    afterAll(^{
        starShotCell = nil;
    });
    
    describe(@"Star Shot Cell initialization", ^{
        
        describe(@"favorite button", ^{
            context(@"when cell initialized favorite button", ^{
                it(@"shouldn't be nil", ^{
                    [starShotCell.starButton shouldNotBeNil];
                });
                it(@"should responde selector", ^{
                    NSNumber *actionMethod = @([starShotCell respondsToSelector:@selector(favPressed)]);
                    [[actionMethod should] beTrue];
                });
            });
        });
        
    });
    
});

SPEC_END
