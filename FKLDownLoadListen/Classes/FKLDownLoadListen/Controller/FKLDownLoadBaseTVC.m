//
//  FKLDownLoadBaseTVC.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLDownLoadBaseTVC.h"
#import "FKLDownLoadView.h"

@interface FKLDownLoadBaseTVC ()

@property (nonatomic, weak) FKLDownLoadView *noDataView;

@property (nonatomic, strong) NSArray *models;

@property (nonatomic, copy) LoadCellType loadCell;

@property (nonatomic, copy) LoadCellHType loadCellH;

@property (nonatomic, copy) BindType bind;

@end

@implementation FKLDownLoadBaseTVC

#pragma mark - Lift cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupData];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self setupLayout];
}

#pragma mark - Private methods

- (void)setupUI {
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
}

- (void)setupLayout {
    CGFloat x = self.view.frame.size.width * 0.5;
    CGFloat y = self.view.frame.size.height * 0.4;
    self.noDataView.center = CGPointMake(x, y);
}

- (void)setupData {
    UIImage *noDownLoadedImg = [UIImage imageNamed:@"noData_download"];
    self.noDataView.noDataImage = noDownLoadedImg;
    
    if ( [self isKindOfClass:NSClassFromString(@"FKLDownLoadingTVC")] ) {
        noDownLoadedImg = [UIImage imageNamed:@"noData_downloading"];
        self.noDataView.noDataImage = noDownLoadedImg;
    }
    
    [self.noDataView setClickBlock:^{
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = self.models.count;
    self.noDataView.hidden = count != 0;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.loadCell(tableView, indexPath);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.models[indexPath.row];
    
    self.bind(model, cell);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.models[indexPath.row];
    return self.loadCellH(model);
}

#pragma mark - interface methods

- (void)setupDataSource:(NSArray *)models loadCellBlock:(LoadCellType)loadCellBlock loadCellHeight:(LoadCellHType)loadCellHeightBlock bindBlock:(BindType)bindBlock {
    self.loadCell = loadCellBlock;
    self.loadCellH = loadCellHeightBlock;
    self.bind = bindBlock;
    self.models = models;
}

- (void)setModels:(NSArray *)models {
    _models = models;
    [self.tableView reloadData];
}

#pragma mark - Getter methods

- (FKLDownLoadView *)noDataView {
    if ( nil == _noDataView ) {
        FKLDownLoadView *noDataView = [[FKLDownLoadView alloc] initWithFrame:CGRectMake(0, 0, 242, 239)];
        [self.view addSubview:noDataView];
        _noDataView = noDataView;
    }
    return _noDataView;
}

@end
