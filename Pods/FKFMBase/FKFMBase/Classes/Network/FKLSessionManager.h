//
//  FKLSessionManager.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RequestTypeGet,
    RequestTypePost
} RequestType;

@interface FKLSessionManager : NSObject

- (void)setValue:(NSString *)value forHttpField:(NSString *)field;

- (void)request:(RequestType)requestType urlStr:(NSString *)urlStr parameter:(NSDictionary *)param resultBlock:(void (^)(id responseObject, NSError *error))resultBlock;

@end
