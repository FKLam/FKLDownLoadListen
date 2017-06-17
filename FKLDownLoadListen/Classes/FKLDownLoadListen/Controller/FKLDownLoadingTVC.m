//
//  FKLDownLoadingTVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLDownLoadingTVC.h"

@interface FKLDownLoadingTVC ()

@end

@implementation FKLDownLoadingTVC

#pragma mark - Lift cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - setupUI

- (void)setupUI {
    [self setupDataSource:@[@"24q4edcftq5", @"eokvfetf"] loadCellBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
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
