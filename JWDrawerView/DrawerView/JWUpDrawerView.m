//
//  JWUpDrawerView.m
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "JWUpDrawerView.h"

@implementation JWUpDrawerView

- (instancetype)initWithContentView:(UIView *)contentView contentOffset:(CGFloat)contentOffset toggleView:(UIView *)toggleView toggleOffset:(CGFloat)toggleOffset parentView:(UIView *)parentView;
{
    self = [super initWithContentView:contentView contentOffset:contentOffset toggleView:toggleView toggleOffset:toggleOffset parentView:parentView];
    if (self) {
        self.frame = CGRectMake(contentOffset, -contentView.frame.size.height, contentView.frame.size.width, contentView.frame.size.height + toggleView.frame.size.height);
        _openCenter = CGPointMake(contentOffset + self.frame.size.width / 2, self.frame.size.height / 2);
        _closeCenter = CGPointMake(_openCenter.x, (toggleView.frame.size.height - contentView.frame.size.height) / 2);
        
        contentView.frame = CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height);
        toggleView.frame = CGRectMake(toggleOffset, contentView.frame.size.height, toggleView.frame.size.width, toggleView.frame.size.height);
    }
    return self;
}

- (BOOL)beyondOpen:(CGPoint)translation
{
    return self.center.y + translation.y > _openCenter.y;
}

- (BOOL)beyondClose:(CGPoint)translation
{
    return self.center.y + translation.y < _closeCenter.y;
}

- (BOOL)shouldOpen
{
    return self.center.y > _openCenter.y * OPEN_RATIO;
}

- (CGPoint)centerAfterTranslation:(CGPoint)translation
{
    return CGPointMake(self.center.x, self.center.y + translation.y);
}

@end
