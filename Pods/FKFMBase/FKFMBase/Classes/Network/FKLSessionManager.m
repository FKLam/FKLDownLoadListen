//
//  FKLSessionManager.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLSessionManager.h"
#import <AFNetworking/AFNetworking.h>

@interface FKLSessionManager ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation FKLSessionManager

- (void)setValue:(NSString *)value forHttpField:(NSString *)field {
    [self.sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}

- (void)request:(RequestType)requestType urlStr:(NSString *)urlStr parameter:(NSDictionary *)param resultBlock:(void (^)(id, NSError *))resultBlock {
    
    void (^successBlock)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        resultBlock(responseObject, nil);
    };
    
    void (^failBlock)(NSURLSessionDataTask * _Nonnull task, NSError * _Nullable error) = ^(NSURLSessionDataTask * _Nonnull task, NSError * _Nullable error) {
        resultBlock(nil, error);
    };
    
    if ( requestType == RequestTypeGet ) {
        [self.sessionManager GET:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    } else {
        [self.sessionManager POST:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    }
    
}

- (AFHTTPSessionManager *)sessionManager {
    if ( nil == _sessionManager ) {
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        NSMutableSet *setM = [_sessionManager.responseSerializer.acceptableContentTypes mutableCopy];
        [setM addObject:@"text/plain"];
        [setM addObject:@"text/html"];
        _sessionManager.responseSerializer.acceptableContentTypes = [setM copy];
    }
    return _sessionManager;
}

@end
