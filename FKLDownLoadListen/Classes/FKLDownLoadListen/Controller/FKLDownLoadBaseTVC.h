//
//  FKLDownLoadBaseTVC.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_REUSEIDENTIFIER_ID NSStringFromClass([self class])

typedef UITableViewCell *(^LoadCellType)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat(^LoadCellHType)(id model);
typedef void(^BindType)(id model, UITableViewCell *cell);

@interface FKLDownLoadBaseTVC : UITableViewController

- (void)setupDataSource:(NSArray *)models loadCellBlock:(LoadCellType)loadCellBlock loadCellHeight:(LoadCellHType)loadCellHeightBlock bindBlock:(BindType)bindBlock;

@end
