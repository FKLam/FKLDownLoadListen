//
//  FKLTodayFireMainVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLTodayFireMainVC.h"
#import "FKLSementBarVC.h"
#import "FKLCategoryModel.h"
#import "FKLTodayFireVideoListTVC.h"
#import "FKLTodayFireDataTool.h"

@interface FKLTodayFireMainVC ()

@property (nonatomic, strong) FKLSementBarVC *segContentVC;
@property (nonatomic, strong) NSArray<FKLCategoryModel *> *categoryMs;

@end

#pragma mark Life cycle

@implementation FKLTodayFireMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

#pragma mark - setupUI

- (void)setupUI {
    self.title = @"今日最火";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.segContentVC.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.segContentVC.view];
}

- (void)loadData {
    __weak typeof( self ) weakSelf = self;
    [[FKLTodayFireDataTool shareInstance] getCategoryMs:^(NSArray<FKLCategoryModel *> *categoryMs) {
        weakSelf.categoryMs = categoryMs;
    }];
}

#pragma mark - Setter methods

- (void)setCategoryMs:(NSArray<FKLCategoryModel *> *)categoryMs {
    _categoryMs = categoryMs;
    
    NSInteger vcCount = _categoryMs.count;
    NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:vcCount];
    for ( FKLCategoryModel *model in _categoryMs ) {
        FKLTodayFireVideoListTVC *vc = [[FKLTodayFireVideoListTVC alloc] init];
        vc.loadKey = model.key;
        [vcs addObject:vc];
    }
    
    [self.segContentVC setUpWithItems:[categoryMs valueForKey:@"name"] childVCs:vcs];
}

#pragma mark - Getter methods

- (FKLSementBarVC *)segContentVC {
    if ( nil == _segContentVC ) {
        FKLSementBarVC *segContentVC = [[FKLSementBarVC alloc] init];
        [self addChildViewController:segContentVC];
        _segContentVC = segContentVC;
    }
    return _segContentVC;
}

@end
