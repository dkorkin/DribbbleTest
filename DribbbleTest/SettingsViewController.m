//
//  SettingsViewController.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import "SettingsViewController.h"
#import "UIApplication+BuildVersion.h"

@interface SettingsViewController ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gitUrl;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic, strong) NSString *buildDate;

@end

@implementation SettingsViewController

-(id)init {
    self = [super init];
    if(self) {
        [self setInitialTexts];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self textSetups];
}


-(void) setInitialTexts {
    _name = @"Korkin Dmitryi";
    _gitUrl = @"https://github.com/dkorkin";
    _appVersion = [UIApplication versionBuild];
    _buildDate = [UIApplication getBuildDate];
}

-(void) textSetups {
    self.nameLabel.text = _name;
    self.linkLabel.text = [NSString stringWithFormat:@"GitHub Link: %@", _gitUrl];
    self.appVersionLabel.text = [NSString stringWithFormat:@"Build version: %@", _appVersion];
    self.appDateLabel.text = [NSString stringWithFormat:@"Date of Build: %@", _buildDate];
}



@end
