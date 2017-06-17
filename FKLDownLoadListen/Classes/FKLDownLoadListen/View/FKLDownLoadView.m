//
//  FKLDownLoadView.m
//  FKLDownLoadListen
//
//  Created by kun on 2017/6/17.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "FKLDownLoadView.h"

@interface FKLDownLoadView ()

@property (nonatomic, weak) UIImageView *noDataImageView;
@property (nonatomic, weak) UIButton *clickButton;

@end

@implementation FKLDownLoadView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( self ) {
        [self setupUI];
        [self setupLayout];
    }
    return self;
}

#pragma mark - SetupUI

- (void)setupUI {
    self.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.noDataImageView];
    [self addSubview:self.clickButton];
}

- (void)setupLayout {
    CGFloat imageW = 150;
    CGFloat imageH = 150;
    CGFloat imageX = ( self.frame.size.width - imageW ) / 2.0;
    CGFloat imageY = 0;
    self.noDataImageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat btnW = 80;
    CGFloat btnH = 30;
    CGFloat btnY = CGRectGetMaxY(self.noDataImageView.frame) + 10;
    CGFloat btnX = ( self.frame.size.width - btnW ) / 2.0;
    self.clickButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
}

#pragma mark - event response

- (void)clickedAction:(UIButton *)sender {
    if ( self.clickBlock ) {
        self.clickBlock();
    }
}

- (void)setNoDataImage:(UIImage *)noDataImage {
    self.noDataImageView.image = noDataImage;
}

#pragma mark Getter methods

- (UIImageView *)noDataImageView {
    if ( nil == _noDataImageView ) {
        UIImageView *noDataImageView = [[UIImageView alloc] init];
        [noDataImageView setImage:[UIImage imageNamed:@"noData_download"]];
        [self addSubview:noDataImageView];
        _noDataImageView = noDataImageView;
    }
    return _noDataImageView;
}

- (UIButton *)clickButton {
    if ( nil == _clickButton ) {
        UIButton *clickButton;
        clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [clickButton setTitle:@"去看看" forState:UIControlStateNormal];
        [clickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [clickButton addTarget:self action:@selector(clickedAction:) forControlEvents:UIControlEventTouchUpInside];
        clickButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:clickButton];
        _clickButton = clickButton;
    }
    return _clickButton;
}

@end
