//
//  Shot.h
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/15/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Shot : NSManagedObject

@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSNumber * isInFavorites;
@property (nonatomic, retain) NSNumber * shotId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * imageUrl;

@end
