//
//  FKLTodayFireVoiceCellPresenter.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLTodayFireVoiceCellPresenter.h"

@interface FKLTodayFireVoiceCellPresenter ()

@property (nonatomic, weak) FKLTodayFireVoiceCell *cell;

@end

@implementation FKLTodayFireVoiceCellPresenter

- (NSString *)title {
    return self.voiceM.title;
}

- (NSString *)nickname {
    return [NSString stringWithFormat:@"by %@", self.voiceM.nickname];
}

- (NSString *)sortNum {
    return [NSString stringWithFormat:@"%zd", self.voiceM.sortNum];
}

- (void)bindToCell:(FKLTodayFireVoiceCell *)cell {
    cell.voiceTitleLabel.text = self.title;
    cell.voiceAuthorLabel.text = self.nickname;
    cell.sortNumLable.text = self.sortNum;
    
    
}

@end
