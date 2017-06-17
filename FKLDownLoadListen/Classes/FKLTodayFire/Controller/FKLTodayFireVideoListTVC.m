//
//  FKLTodayFireVideoListTVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLTodayFireVideoListTVC.h"
#import "FKLTodayFireDataTool.h"

@interface FKLTodayFireVideoListTVC ()

@property (nonatomic, strong) NSArray<FKLDownLoadVoiceModel *> *voiceMs;

@end

@implementation FKLTodayFireVideoListTVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

#pragma mark - setupUI

- (void)setupUI {
    self.tableView.rowHeight = 80;
}

- (void)loadData {
    __weak typeof( self ) weakSelf = self;
    [[FKLTodayFireDataTool shareInstance] getVoiceMsKey:self.loadKey resultBlock:^(NSArray<FKLDownLoadVoiceModel *> *voiceMs) {
        weakSelf.voiceMs = voiceMs;
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

#pragma mark - Setter methods

- (void)setVoiceMs:(NSArray<FKLDownLoadVoiceModel *> *)voiceMs {
    _voiceMs = voiceMs;
    [self.tableView reloadData];
}

@end
