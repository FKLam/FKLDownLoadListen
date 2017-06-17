//
//  FKLSementBarVC.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKLSegmentBar.h"

@interface FKLSementBarVC : UIViewController

@property (nonatomic, weak) FKLSegmentBar *segmentBar;

- (void)setUpWithItems:(NSArray<NSString *> *)itmes childVCs:(NSArray<UIViewController *> *)childVCs;

@end
