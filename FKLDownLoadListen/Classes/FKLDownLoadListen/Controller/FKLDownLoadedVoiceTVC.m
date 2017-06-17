//
//  FKLDownLoadedVoiceTVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLDownLoadedVoiceTVC.h"

@interface FKLDownLoadedVoiceTVC ()

@end

@implementation FKLDownLoadedVoiceTVC

#pragma mark - Lift cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - setupUI

- (void)setupUI {
    [self setupDataSource:@[@"q245", @"3rfv41"] loadCellBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSEIDENTIFIER_ID];
        
        if ( nil == cell ) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_REUSEIDENTIFIER_ID];
        }
        return cell;
    } loadCellHeight:^CGFloat(id model) {
        CGFloat rowHeight = [model length] * 10;
        return rowHeight;
    } bindBlock:^(id model, UITableViewCell *cell) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", model];
    }];
}

@end
