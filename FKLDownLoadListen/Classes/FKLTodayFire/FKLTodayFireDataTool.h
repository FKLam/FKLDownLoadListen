//
//  FKLTodayFireDataTool.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKLCategoryModel.h"
#import "FKLDownLoadVoiceModel.h"

@interface FKLTodayFireDataTool : NSObject

+ (instancetype)shareInstance;

- (void)getCategoryMs:(void (^)(NSArray<FKLCategoryModel *> *categoryMs))resultBlock;

- (void)getVoiceMsKey:(NSString *)key resultBlock:(void (^)(NSArray<FKLDownLoadVoiceModel *> *voiceMs))resultBlock;

@end
