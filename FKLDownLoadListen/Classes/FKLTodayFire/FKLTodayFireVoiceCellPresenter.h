//
//  FKLTodayFireVoiceCellPresenter.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKLDownLoadVoiceModel.h"
#import "FKLTodayFireVoiceCell.h"

/**
 *  1，准备所有view需要的最终数据
 *  2，展示到view上面
 *
 */
@interface FKLTodayFireVoiceCellPresenter : NSObject

@property (nonatomic, strong) FKLDownLoadVoiceModel *voiceM;

- (void)bindToCell:(FKLTodayFireVoiceCell *)cell;

@end
