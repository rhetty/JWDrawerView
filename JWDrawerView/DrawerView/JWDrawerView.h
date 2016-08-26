//
//  JWDrawerView.h
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

#define OPEN_RATIO 1/3

@interface JWDrawerView : UIView
{
    @protected
    UIView *_toggleView;
    UIView *_contentView;
    UIView *_parentView;
    CGFloat _contentOffset;
    CGFloat _toggleOffset;
    CGPoint _openCenter;
    CGPoint _closeCenter;
}

@property (nonatomic, assign, getter=isOpen) BOOL open;

- (instancetype)initWithContentView:(UIView *)contentView contentOffset:(CGFloat)contentOffset toggleView:(UIView *)toggleView toggleOffset:(CGFloat)toggleOffset parentView:(UIView *)parentView;

#pragma mark - To be inherited
- (BOOL)beyondOpen:(CGPoint)translation;
- (BOOL)beyondClose:(CGPoint)translation;
- (BOOL)shouldOpen;
- (CGPoint)centerAfterTranslation:(CGPoint)translation;

@end
