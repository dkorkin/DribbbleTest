//
//  BaseShotCellSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/10/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//
#import "Kiwi.h"
#import "BaseShotCell.h"
#import "BaseShotCell_Private.h"

SPEC_BEGIN(BaseShotCellSpecs)

describe(@"Base Shot Cell",^{
    __block BaseShotCell *shotCell;
    __block Shot *shot;

    beforeAll(^{
        shotCell = [[BaseShotCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShotCell"];
        shot = [Shot MR_createEntity];
        shotCell.shot = shot;
    });

    afterAll(^{
        [shot MR_deleteEntity];
        shotCell = nil;
    });

    describe(@"Base Shot Cell initialization", ^{
        
        describe(@"Shot image view", ^{
            context(@"when cell initialized", ^{
                it(@"shouldn't be nil", ^{
                    [shotCell.shotImageView shouldNotBeNil];
                });
            });
        });
        
        describe(@"Shot title label", ^{
            context(@"when cell initialized", ^{
                it(@"shouldn't be nil", ^{
                    [shotCell.shotTitle shouldNotBeNil];
                });
            });
        });
        
    });
    

    describe(@"Base Shot Cell get Shot", ^{

        describe(@"Shot image", ^{
            context(@"when image isn't set", ^{
                it(@"should be nil", ^{
                    [shotCell.shotImageView.image shouldBeNil];
                });
            });
            context(@"when image file not exists", ^{
                it(@"should be nil", ^{
                    shotCell.shotImageView.image = [UIImage imageNamed:@"not_existing_image"];
                    [shotCell.shotImageView.image shouldBeNil];
                });
            });
            context(@"when image file get from shot", ^{
                it(@"shouldn't be nil", ^{
                    shot.imageName = @"1.jpg";
                    shotCell.shot = shot;
                    [shotCell redraw];
                    [shotCell.shotImageView.image shouldNotBeNil];
                });
            });
        });
        
        describe(@"Shot Label", ^{
            __block NSString *shotTitleText = @"Text test";
            context(@"when text isn't set", ^{
                it(@"should be nil", ^{
                    [shotCell.shotTitle.text shouldBeNil];
                });
            });
            context(@"when text is set from shot", ^{
                it(@"shouldn't be nil", ^{
                    shot.title = shotTitleText;
                    shotCell.shot = shot;
                    [shotCell redraw];
                    [shotCell.shotTitle.text shouldNotBeNil];
                });
                it(@"should be same as in shot", ^{
                    [[shotCell.shotTitle.text should] equal:shot.title];
                });
            });
        });
        
        describe(@"Shot Label frame after text was set", ^{
            context(@"when text is set", ^{
                
                shot.title = @"Text test testtest  test test test testtesttest test test test test test";
                shotCell.shot = shot;
                [shotCell redraw];
                
                it(@"should be in cell bounds", ^{
                    BOOL isLabelInFrame = CGRectContainsRect(shotCell.bounds, shotCell.shotTitle.frame);
                    NSNumber *isLabelInFrameNumber = [NSNumber numberWithBool:isLabelInFrame];
                    [[isLabelInFrameNumber should] beYes];
                });
                it(@"text should be in label frame", ^{
                    CGRect labelFrame = shotCell.shotTitle.frame;
                    NSDictionary *attributes = @{NSFontAttributeName: shotCell.shotTitle.font};
                    
                    CGSize textSize = CGSizeMake(kShotTitleWidth, MAXFLOAT);
                    CGRect textNameRect = [shotCell.shotTitle.text boundingRectWithSize:textSize
                                                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                                                              attributes:attributes
                                                                                 context:nil];
                    BOOL islabelFrameNotLessThanTextSize = NO;
                    if(textNameRect.size.width <= labelFrame.size.width &&
                       textNameRect.size.height <= labelFrame.size.height) {
                        islabelFrameNotLessThanTextSize = YES;
                    }
                    NSNumber *islabelFrameNotLessThanTextSizeNumber = [NSNumber numberWithBool:islabelFrameNotLessThanTextSize];
                    [[islabelFrameNotLessThanTextSizeNumber should] beYes];
                    
                });
            });

        });
        
        describe(@"Cell Height", ^{
            context(@"Label has text cell height need be recounted", ^{
                it(@"should be equal to text height for long text", ^{
                    shot.title = @"dsjhfgdjhgfhjegf jerjfgegrfjehgrfgerhgfjegrfjehrg fjegrfjegrfgerjfgje eyuwtr yewurt  wyuert";
                    
                    CGFloat cellHeight = [BaseShotCell cellHeightFromShot:shot];
                    
                    NSDictionary *attributes = @{NSFontAttributeName: shotCell.shotTitle.font};
                    CGSize textSize = CGSizeMake(kShotTitleWidth, MAXFLOAT);
                    CGRect textNameRect = [shot.title boundingRectWithSize:textSize
                                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                                attributes:attributes
                                                                   context:nil];
                    
                    CGFloat requaredCellHeigth = textNameRect.size.height + kShotImageTopAndBottomMargin * 2;
                    [[theValue(cellHeight) should] equal:theValue(requaredCellHeigth)];
                });
                it(@"should be equal to image height for shot text", ^{
                    shot.title = @"Test";
                    CGFloat cellHeight = [BaseShotCell cellHeightFromShot:shot];
                    CGFloat requaredCellHeigth = kShotImageHeight + kShotImageTopAndBottomMargin * 2;
                    [[theValue(cellHeight) should] equal:theValue(requaredCellHeigth)];
                });
            });
        });
        
    });
});

SPEC_END
