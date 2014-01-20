//
//  SettingsViewController.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 12/26/13.
//  Copyright (c) 2013 Dmitriy Korkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;
@property (weak, nonatomic) IBOutlet UILabel *appVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *appDateLabel;

@end
