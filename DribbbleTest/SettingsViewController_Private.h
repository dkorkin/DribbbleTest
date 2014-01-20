//
//  SettingsViewController_Private.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController() 

@property NSString *name;
@property NSString *gitUrl;
@property NSString *appVersion;
@property NSString *buildDate;

-(void) setInitialTexts;

@end