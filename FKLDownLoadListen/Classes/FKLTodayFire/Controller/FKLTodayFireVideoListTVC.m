//
//  FKLTodayFireVideoListTVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLTodayFireVideoListTVC.h"
#import "FKLTodayFireDataTool.h"
#import "FKLTodayFireVoiceCellPresenter.h"

@interface FKLTodayFireVideoListTVC ()

@property (nonatomic, strong) NSArray<FKLTodayFireVoiceCellPresenter *> *presenterMs;

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
        NSMutableArray *ps = [NSMutableArray array];
        for ( FKLDownLoadVoiceModel *model in voiceMs ) {
            FKLTodayFireVoiceCellPresenter *presenter = [[FKLTodayFireVoiceCellPresenter alloc] init];
            presenter.voiceM = model;
            [ps addObject:presenter];
        }
        weakSelf.presenterMs = ps;
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenterMs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FKLTodayFireVoiceCell *cell = [FKLTodayFireVoiceCell cellWithTableView:tableView];
    FKLTodayFireVoiceCellPresenter *presenter = self.presenterMs[indexPath.row];
    presenter.voiceM.sortNum = indexPath.row + 1;
    [presenter bindToCell:cell];
    return cell;
}

#pragma mark - Setter methods



- (void)setPresenterMs:(NSArray<FKLTodayFireVoiceCellPresenter *> *)presenterMs {
    _presenterMs = presenterMs;
    
    [self.tableView reloadData];
}

@end
