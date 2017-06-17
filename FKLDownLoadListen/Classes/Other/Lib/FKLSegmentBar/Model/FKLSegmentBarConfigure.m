//
//  FKLSegmentBarConfigure.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLSegmentBarConfigure.h"

@implementation FKLSegmentBarConfigure

+ (instancetype)defaultConfig {
    
    FKLSegmentBarConfigure *config = [[FKLSegmentBarConfigure alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;
    
    return config;
    
}

- (FKLSegmentBarConfigure *(^)(UIColor *))itemNC
{
    
    return ^(UIColor *color) {
        self.itemNormalColor = color;
        return self;
    };
    
}

- (FKLSegmentBarConfigure *(^)(UIColor *))itemSC
{
    
    return ^(UIColor *color) {
        self.itemSelectColor = color;
        return self;
    };
    
}


- (FKLSegmentBarConfigure *(^)(CGFloat))indicatorEW
{
    return ^(CGFloat w) {
        self.indicatorExtraW = w;
        return self;
    };
}

@end
