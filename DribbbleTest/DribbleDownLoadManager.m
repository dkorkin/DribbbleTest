//
//  DribbleDownLoadManager.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/13/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "DribbleDownLoadManager.h"
#import "AFNetworking.h"
#import "GCDSingleton.h"

NSInteger const kShotsPerPage = 25;

@implementation DribbleDownLoadManager

+ (instancetype)sharedInstance {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

- (void)testRequest {
    NSURL *baseUrl = [NSURL URLWithString:@"http://localhost:8080"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];

    [manager GET:@"/everyone"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"%@", responseObject);
         }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
}

- (void)requestForShotsFromPages:(NSArray *)pages {
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://api.dribbble.com/shots/everyone"
//      parameters:nil
//         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//             NSLog(@"JSON: %@", responseObject);
//         }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             NSLog(@"Error: %@", error);
//         }
//     ];
    
 
    
    NSOperationQueue *networkQueue = [[NSOperationQueue alloc] init];
    networkQueue.maxConcurrentOperationCount = 5;
    
    NSMutableArray *operations = [NSMutableArray new];
    for (NSNumber *pageNumber in pages) {
        [operations addObject:[self shotOperationForPageNumber:pageNumber]];
    }
    [networkQueue addOperations:operations waitUntilFinished:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setOperationQueue:networkQueue];
}

- (AFHTTPRequestOperation *)shotOperationForPageNumber:(NSNumber *)page {
    NSString *requestString = [NSString stringWithFormat:@"http://api.dribbble.com/shots/everyone?per_page=%d&page=%@",kShotsPerPage, page];
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%s: AFHTTPRequestOperation error: %@", __FUNCTION__, error);
    }];
    return operation;
}

@end
