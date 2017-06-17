//
//  FKLTodayFireDataTool.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLTodayFireDataTool.h"
#import "FKLSessionManager.h"
#import <MJExtension/MJExtension.h>

#define kBaseUrl @"http://mobile.ximalaya.com/"

@interface FKLTodayFireDataTool ()

@property (nonatomic, strong) FKLSessionManager *sessionManager;

@end

@implementation FKLTodayFireDataTool

static FKLTodayFireDataTool *_instance = nil;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ( nil == _instance ) {
            _instance = [[FKLTodayFireDataTool alloc] init];
        }
    });
    return _instance;
}

- (void)getCategoryMs:(void (^)(NSArray<FKLCategoryModel *> *))resultBlock {
    // 发送网络请求
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"moblie/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device" : @"iPhone",
                            @"key" : @"ranking:track:scoreByTime:1:0",
                            @"pageId" : @"1",
                            @"pageSize" : @"0"
                            };
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        FKLCategoryModel *categoryM = [[FKLCategoryModel alloc] init];
        categoryM.key = @"ranking:track:scoreByTime:1:0";
        categoryM.name = @"总榜";
        
        NSMutableArray<FKLCategoryModel *> *categoryMs = [FKLCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"categories"]];
        if ( 0 < categoryMs.count ) {
            [categoryMs insertObject:categoryM atIndex:0];
        }
        
        resultBlock(categoryMs);
    }];
}

- (void)getVoiceMsKey:(NSString *)key resultBlock:(void (^)(NSArray<FKLDownLoadVoiceModel *> *))resultBlock {
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device" : @"iPhone",
                            @"key" : key,
                            @"pageId" : @"1",
                            @"pageSize" : @"30"
                            };
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        NSMutableArray<FKLDownLoadVoiceModel *> *voiceMs = [FKLDownLoadVoiceModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        resultBlock(voiceMs);
    }];
}

#pragma mark - Getters methods

- (FKLSessionManager *)sessionManager {
    if ( nil == _sessionManager ) {
        _sessionManager = [[FKLSessionManager alloc] init];
    }
    return _sessionManager;
}

@end
