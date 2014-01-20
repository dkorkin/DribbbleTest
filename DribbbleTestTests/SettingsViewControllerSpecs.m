//
//  SettingsViewControllerSpecs.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/10/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "Kiwi.h"
#import "UIApplication+BuildVersion.h"
#import "SettingsViewController.h"
#import "SettingsViewController_Private.h"

SPEC_BEGIN(SettingsViewControllerSpecs)

describe(@"SettingsViewController initialize", ^{
    
    __block SettingsViewController *_settingsViewController;
    
    beforeAll(^{
        _settingsViewController = [SettingsViewController new];
        [_settingsViewController setInitialTexts];
        [_settingsViewController loadView];
        
    });
    
    afterAll(^{
        _settingsViewController = nil;
    });
    
    describe(@"SettingsViewController text are initialized", ^{
        context(@"when name is initialized", ^{
            it(@"shouldn't be nil", ^{
                [_settingsViewController.name shouldNotBeNil];
            });
            it(@"length shouldn't equals zero", ^{
                NSNumber *nameLength = @(_settingsViewController.name.length);
                [[theValue(nameLength) shouldNot] equal:theValue(0)];
            });
            it(@"should be in correct format (two words with space)", ^{
                NSString *pattern = @"^[a-zA-Z]+ {1}[a-zA-Z]+$";
                [[_settingsViewController.name should] matchPattern:pattern];
            });
        });
        
        context(@"when github url is initialized", ^{
            it(@"shouldn't be nil", ^{
                [_settingsViewController.gitUrl shouldNotBeNil];
            });
            it(@"should be in correct format (url)", ^{
                NSString *pattern = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
                [[_settingsViewController.gitUrl should] matchPattern:pattern];
            });
        });
        
        context(@"when date of build is initialized", ^{
            it(@"shouldn't be nil", ^{
                [_settingsViewController.buildDate shouldNotBeNil];
            });
            it(@"length shouldn't equals zero", ^{
                NSNumber *dateLength = @(_settingsViewController.buildDate.length);
                [[theValue(dateLength) shouldNot] equal:theValue(0)];
            });
            it(@"should be equal to getBuildDate from UIApplication category", ^{
                NSString *dateBuild = [UIApplication getBuildDate];
                [[_settingsViewController.buildDate should] equal:dateBuild];
            });
        });
        
        context(@"when version of build is initialized", ^{
            it(@"shouldn't be nil", ^{
                [_settingsViewController.appVersion shouldNotBeNil];
            });
            it(@"should be checked for correctness", ^{
                NSString * version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
                NSString * build = [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
                
                NSString * versionBuild = [NSString stringWithFormat:@"v%@", version];
                
                if (![version isEqualToString: build]) {
                    versionBuild = [NSString stringWithFormat:@"%@(%@)", versionBuild, build];
                }

                [[_settingsViewController.appVersion should] equal:versionBuild];
            });
        });
    });
    
    describe(@"SettingsVC texts are setted to labels", ^{
        context(@"If Label Frames in View", ^{
            it(@"label for Name frame should be in view of VC", ^{
                BOOL isLabelInFrame = CGRectContainsRect(_settingsViewController.view.frame,
                                                         _settingsViewController.nameLabel.frame);
                NSNumber *isLabelInFrameNumber = [NSNumber numberWithBool:isLabelInFrame];
                [[isLabelInFrameNumber should] beYes];
            });
            it(@"label for link frame should be in view of VC", ^{
                BOOL isLabelInFrame = CGRectContainsRect(_settingsViewController.view.frame,
                                                         _settingsViewController.linkLabel.frame);
                NSNumber *isLabelInFrameNumber = [NSNumber numberWithBool:isLabelInFrame];
                [[isLabelInFrameNumber should] beYes];
            });
            it(@"label for build version frame should be in view of VC", ^{
                BOOL isLabelInFrame = CGRectContainsRect(_settingsViewController.view.frame,
                                                         _settingsViewController.appVersionLabel.frame);
                NSNumber *isLabelInFrameNumber = [NSNumber numberWithBool:isLabelInFrame];
                [[isLabelInFrameNumber should] beYes];
            });
            it(@"label for app date frame should be in view of VC", ^{
                BOOL isLabelInFrame = CGRectContainsRect(_settingsViewController.view.frame,
                                                         _settingsViewController.appDateLabel.frame);
                NSNumber *isLabelInFrameNumber = [NSNumber numberWithBool:isLabelInFrame];
                [[isLabelInFrameNumber should] beYes];
            });

        });
        
        context(@"If Label Texts in Frame", ^{
            it(@"Name text should be in label frame", ^{
                NSString *textForCheck = _settingsViewController.nameLabel.text;
                
                CGRect labelFrame = _settingsViewController.nameLabel.frame;
                NSDictionary *attributes = @{NSFontAttributeName: _settingsViewController.nameLabel.font};
                
                CGSize textSize = CGSizeMake(labelFrame.size.width, MAXFLOAT);
                CGRect textNameRect = [textForCheck boundingRectWithSize:textSize
                                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                                              attributes:attributes
                                                                 context:nil];
                BOOL islabelFrameNotLessThanTextSize = NO;
                if(textNameRect.size.width <= labelFrame.size.width &&
                   textNameRect.size.height <=  labelFrame.size.height) {
                    islabelFrameNotLessThanTextSize = YES;
                }
                NSNumber *islabelFrameNotLessThanTextSizeNumber = [NSNumber numberWithBool:islabelFrameNotLessThanTextSize];
                [[islabelFrameNotLessThanTextSizeNumber should] beYes];
                
            });
            it(@"Link text should be in label frame", ^{
                NSString *textForCheck = _settingsViewController.nameLabel.text;
                
                CGRect labelFrame = _settingsViewController.linkLabel.frame;
                NSDictionary *attributes = @{NSFontAttributeName: _settingsViewController.linkLabel.font};
                
                CGSize textSize = CGSizeMake(labelFrame.size.width, MAXFLOAT);
                CGRect textLinkRect = [textForCheck boundingRectWithSize:textSize
                                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                                              attributes:attributes
                                                                 context:nil];
                BOOL islabelFrameNotLessThanTextSize = NO;
                if(textLinkRect.size.width <= labelFrame.size.width &&
                   textLinkRect.size.height <=  labelFrame.size.height) {
                    islabelFrameNotLessThanTextSize = YES;
                }
                NSNumber *islabelFrameNotLessThanTextSizeNumber = [NSNumber numberWithBool:islabelFrameNotLessThanTextSize];
                [[islabelFrameNotLessThanTextSizeNumber should] beYes];
            });
        });
        
    });
    
});

SPEC_END
