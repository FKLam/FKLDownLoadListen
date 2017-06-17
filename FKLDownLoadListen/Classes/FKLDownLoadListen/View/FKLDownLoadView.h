//
//  FKLDownLoadView.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKLDownLoadView : UIView

@property (nonatomic, strong) UIImage *noDataImage;

@property (nonatomic, copy) void(^clickBlock)();

@end
