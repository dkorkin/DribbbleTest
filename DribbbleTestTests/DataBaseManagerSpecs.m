//
//  DataBaseManagerSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/9/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "Kiwi.h"
#import "DataBaseManager.h"
#import "Shot.h"

SPEC_BEGIN(DataBaseManagerSpecs)

describe(@"DataBase Manager Read", ^{
    
    __block NSArray *shots = nil;
    
    beforeAll(^{
        shots = [[DataBaseManager sharedInstance] shotsArrayFromDataBase];
        if([shots count] == 0) {
            [[DataBaseManager sharedInstance] fillDataBaseFromPlist:@"ShotsPList"];
            shots = [[DataBaseManager sharedInstance] shotsArrayFromDataBase];
        }
    });
    
    context(@"when data base if full", ^{
        it(@"it should contain 50 shots", ^{
            [[shots should] haveCountOf:50];
        });
    });

});


describe(@"DataBase Manager Search", ^{
    
    beforeAll(^{
        NSArray *shots = [[DataBaseManager sharedInstance] shotsArrayFromDataBase];
        if([shots count] == 0) {
            [[DataBaseManager sharedInstance] fillDataBaseFromPlist:@"ShotsPList"];
        }
    });
    
    context(@"when data base if full", ^{
        it(@"it should contain shot with certain id", ^{
            NSNumber *shotId = @10;
            Shot *shot = [[DataBaseManager sharedInstance] shotById:shotId];
            [[theValue(shot.shotId) should] equal:theValue(shotId)];
        });
    });
    
});




SPEC_END
