//
//  FKLAlbumTVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLAlbumTVC.h"

@interface FKLAlbumTVC ()

@end

@implementation FKLAlbumTVC

#pragma mark - Lift cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - setupUI 

- (void)setupUI {
    [self setupDataSource:@[@"2axc", @"w3edc"] loadCellBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSEIDENTIFIER_ID];
    
        if ( nil == cell ) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_REUSEIDENTIFIER_ID];
        }
        return cell;
    } loadCellHeight:^CGFloat(id model) {
        CGFloat rowHeight = [model length] * 20;
        return rowHeight;
    } bindBlock:^(id model, UITableViewCell *cell) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", model];
    }];
}

@end
