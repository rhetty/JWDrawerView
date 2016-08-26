//
//  JWLeftDrawerView.m
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "JWLeftDrawerView.h"

@implementation JWLeftDrawerView

- (instancetype)initWithContentView:(UIView *)contentView contentOffset:(CGFloat)contentOffset toggleView:(UIView *)toggleView toggleOffset:(CGFloat)toggleOffset parentView:(UIView *)parentView;
{
    self = [super initWithContentView:contentView contentOffset:contentOffset toggleView:toggleView toggleOffset:toggleOffset parentView:parentView];
    if (self) {
        self.frame = CGRectMake(-contentView.frame.size.width, contentOffset, contentView.frame.size.width + toggleView.frame.size.width, contentView.frame.size.height);
        _openCenter = CGPointMake(self.frame.size.width / 2, contentOffset + self.frame.size.height / 2);
        _closeCenter = CGPointMake((toggleView.frame.size.width - contentView.frame.size.width) / 2, _openCenter.y);
        
        contentView.frame = CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height);
        toggleView.frame = CGRectMake(contentView.frame.size.width, toggleOffset, toggleView.frame.size.width, toggleView.frame.size.height);
    }
    return self;
}

- (BOOL)beyondOpen:(CGPoint)translation
{
    return self.center.x + translation.x > _openCenter.x;
}

- (BOOL)beyondClose:(CGPoint)translation
{
    return self.center.x + translation.x < _closeCenter.x;
}

- (BOOL)shouldOpen
{
    return self.center.x > _openCenter.x * OPEN_RATIO;
}

- (CGPoint)centerAfterTranslation:(CGPoint)translation
{
    return CGPointMake(self.center.x + translation.x, self.center.y);
}

@end
