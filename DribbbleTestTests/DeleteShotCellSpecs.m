//
//  DeleteShotCellSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/10/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//
#import "Kiwi.h"
#import "DeleteShotCell.h"
#import "DeleteShotCell_Private.h"

SPEC_BEGIN(DeleteShotCellSpecs)

describe(@"",^{
    __block DeleteShotCell *deleteShotCell = nil;
    
    beforeAll(^{
        deleteShotCell = [[DeleteShotCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DeleteShotCell"];
        [deleteShotCell redraw];
    });
    
    afterAll(^{
        deleteShotCell = nil;
    });
    
    describe(@"Delete Shot Cell initialization", ^{
        
        describe(@"delete button", ^{
            context(@"when cell initialized delete button", ^{
                it(@"shouldn't be nil", ^{
                    [deleteShotCell.deleteButton shouldNotBeNil];
                });
                it(@"should responde selector", ^{
                    NSNumber *actionMethod = @([deleteShotCell respondsToSelector:@selector(deletePressed)]);
                    [[actionMethod should] beTrue];
                });
            });
        });
        
    });
    
});

SPEC_END