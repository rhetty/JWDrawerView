//
//  JWDrawerView.m
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "JWDrawerView.h"

@interface JWDrawerView()

@end

@implementation JWDrawerView

- (instancetype)initWithContentView:(UIView *)contentView contentOffset:(CGFloat)contentOffset toggleView:(UIView *)toggleView toggleOffset:(CGFloat)toggleOffset parentView:(UIView *)parentView
{
    self = [super init];
    if (self) {
        _contentView = contentView;
        _contentOffset = contentOffset;
        _toggleView = toggleView;
        _toggleOffset = toggleOffset;
        _parentView = parentView;
        self.open = NO;
        contentView.hidden = YES;
        
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        _toggleView.userInteractionEnabled = YES;
        
        [self addSubview:contentView];
        [self addSubview:toggleView];
        [self addGestures];
    }
    return self;
}

- (void)addGestures
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [_toggleView addGestureRecognizer:tap];
    
    UIGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_toggleView addGestureRecognizer:pan];
}

- (void)tapped
{
    self.open = !self.isOpen;
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        _contentView.hidden = NO;
        [_parentView bringSubviewToFront:self];
    }
    CGPoint translation = [recognizer translationInView:_parentView];
    
    if ([self beyondOpen:translation]) {
        self.center = _openCenter;
    } else if([self beyondClose:translation]) {
        self.center = _closeCenter;
    } else {
        self.center = [self centerAfterTranslation:translation];
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:_parentView];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([self shouldOpen]) {
            self.open = YES;
        } else {
            self.open = NO;
        }
    }
}

- (void)setOpen:(BOOL)open
{
    if (open) {
        _contentView.hidden = NO;
        [_parentView bringSubviewToFront:self];
    }
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionTransitionCurlUp
                     animations:^{
                         self.center = open ? _openCenter : _closeCenter;
    } completion:^(BOOL finished) {
        if (finished) {
            _open = open;
            if (!open) {
                _contentView.hidden = YES;
                [_parentView sendSubviewToBack:self];
            }
        }
    }];
}

#pragma mark - To be inherited

- (BOOL)beyondOpen:(CGPoint)translation
{
    return NO;
}

- (BOOL)beyondClose:(CGPoint)translation
{
    return NO;
}

- (BOOL)shouldOpen
{
    return NO;
}

- (CGPoint)centerAfterTranslation:(CGPoint)translation
{
    return CGPointZero;
}

@end
