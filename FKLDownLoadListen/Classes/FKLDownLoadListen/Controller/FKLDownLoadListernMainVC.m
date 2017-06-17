//
//  FKLDownLoadListernMainVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLDownLoadListernMainVC.h"
#import "FKLSementBarVC.h"
#import "FKLAlbumTVC.h"
#import "FKLDownLoadedVoiceTVC.h"
#import "FKLDownLoadingTVC.h"

@interface FKLDownLoadListernMainVC ()

@property (nonatomic, weak) FKLSementBarVC *segmentBarVC;

@end

@implementation FKLDownLoadListernMainVC

#pragma mark Liftcycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupDataSource];
}

#pragma mark - Private methods

// 设置UI界面
- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置导航栏背景色，以及titleView内容视图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 0, 300, 40);
    self.navigationItem.titleView = self.segmentBarVC.segmentBar;
    
    // 设置控制器内容视图
    self.segmentBarVC.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60);
    [self.view addSubview:self.segmentBarVC.view];
}

// 设置需要展示的数据源
- (void)setupDataSource {
    FKLAlbumTVC *vc1 = [[FKLAlbumTVC alloc] init];
    FKLDownLoadedVoiceTVC *vc2 = [[FKLDownLoadedVoiceTVC alloc] init];
    FKLDownLoadingTVC *vc3 = [[FKLDownLoadingTVC alloc] init];
    [self.segmentBarVC setUpWithItems:@[@"专辑", @"声音", @"下载中"] childVCs:@[vc1, vc2, vc3]];
    
    [self.segmentBarVC.segmentBar updateWithConfigure:^(FKLSegmentBarConfigure *configure) {
        
    }];
}

#pragma mark - Lazy load

- (FKLSementBarVC *)segmentBarVC {
    if ( nil == _segmentBarVC ) {
        FKLSementBarVC *segmentBarVC = [[FKLSementBarVC alloc] init];
        [self addChildViewController:segmentBarVC];
        _segmentBarVC = segmentBarVC;
    }
    return _segmentBarVC;
}

@end
