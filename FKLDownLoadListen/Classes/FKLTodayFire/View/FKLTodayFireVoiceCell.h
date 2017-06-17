//
//  FKLTodayFireVoiceCell.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKLTodayFireVoiceCell : UITableViewCell

@property (nonatomic, strong) UILabel *voiceTitleLabel;
@property (nonatomic, strong) UILabel *voiceAuthorLabel;
@property (nonatomic, strong) UILabel *sortNumLable;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
