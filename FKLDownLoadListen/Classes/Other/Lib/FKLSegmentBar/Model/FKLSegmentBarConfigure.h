//
//  FKLSegmentBarConfigure.h
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FKLSegmentBarConfigure : NSObject

+ (instancetype)defaultConfig;

/** 北京颜色 */
@property (nonatomic, strong) UIColor *segmentBarBackColor;

@property (nonatomic, strong) UIColor *itemNormalColor;
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, strong) UIFont *itemFont;

@property (nonatomic, strong) UIColor *indicatorColor;

@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorExtraW;

// 内部实现, 在这个里面写, 外界, 只负责调用
// 功能, 改变 itemNormalColor 的值
//
@property (nonatomic, copy, readonly) FKLSegmentBarConfigure *(^itemNC)(UIColor *color);
@property (nonatomic, copy, readonly) FKLSegmentBarConfigure *(^itemSC)(UIColor *color);
@property (nonatomic, copy, readonly) FKLSegmentBarConfigure *(^indicatorEW)(CGFloat w);



// 链式编程的改法
//- (XMGSegmentBarConfig *(^)(UIColor *color))itemNC;
//- (XMGSegmentBarConfig *(^)(UIColor *color))itemSC;

@end
