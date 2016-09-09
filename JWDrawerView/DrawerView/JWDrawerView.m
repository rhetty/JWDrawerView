//
//  JWDrawerView.m
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "JWDrawerView.h"

@interface JWDrawerView()
@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, weak) UIView *triggerView;
@property (nonatomic, weak) UIView *parentView;
@property (nonatomic, assign) CGFloat contentOffset;
@property (nonatomic, assign) CGFloat triggerOffset;

@property (nonatomic, assign) CGPoint openCenter;
@property (nonatomic, assign) CGPoint closeCenter;
@end

@implementation JWDrawerView

- (void)setLocation:(JWDrawerViewLocation)location
{
    if (location != _location) {
        _location = location;
        [self layout];
    }
}

- (instancetype)initWithContentView:(UIView *)contentView contentOffset:(CGFloat)contentOffset triggerView:(UIView *)triggerView triggerOffset:(CGFloat)triggerOffset parentView:(UIView *)parentView
{
    self = [super init];
    if (self) {
        _contentView = contentView;
        _contentOffset = contentOffset;
        _triggerView = triggerView;
        _triggerOffset = triggerOffset;
        _parentView = parentView;
        self.open = NO;
        contentView.hidden = YES;
        
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        _triggerView.userInteractionEnabled = YES;
        
        [self addSubview:contentView];
        [self addSubview:triggerView];
        [self layout];
        [self addGestures];
    }
    return self;
}

- (void)addGestures
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [_triggerView addGestureRecognizer:tap];
    
    UIGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_triggerView addGestureRecognizer:pan];
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

#pragma mark - Switch Conditions

- (void)layout
{
    switch (self.location) {
        case JWDrawerViewLocationLeft:
            self.frame = CGRectMake(-_contentView.frame.size.width, _contentOffset, _contentView.frame.size.width + _triggerView.frame.size.width, _contentView.frame.size.height);
            _openCenter = CGPointMake(self.frame.size.width / 2, _contentOffset + self.frame.size.height / 2);
            _closeCenter = CGPointMake((_triggerView.frame.size.width - _contentView.frame.size.width) / 2, _openCenter.y);
            
            _contentView.frame = CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height);
            _triggerView.frame = CGRectMake(_contentView.frame.size.width, _triggerOffset, _triggerView.frame.size.width, _triggerView.frame.size.height);
            break;
        case JWDrawerViewLocationRight:
            self.frame = CGRectMake(_parentView.frame.size.width - _triggerView.frame.size.width, _contentOffset, _contentView.frame.size.width + _triggerView.frame.size.width, _contentView.frame.size.height);
            _openCenter = CGPointMake(_parentView.frame.size.width - self.frame.size.width / 2, _contentOffset + self.frame.size.height / 2);
            _closeCenter = CGPointMake(_parentView.frame.size.width - _triggerView.frame.size.width + self.frame.size.width / 2, _openCenter.y);
            
            _contentView.frame = CGRectMake(_triggerView.frame.size.width, 0, _contentView.frame.size.width, _contentView.frame.size.height);
            _triggerView.frame = CGRectMake(0, _triggerOffset, _triggerView.frame.size.width, _triggerView.frame.size.height);
            break;
        case JWDrawerViewLocationTop:
            self.frame = CGRectMake(_contentOffset, -_contentView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height + _triggerView.frame.size.height);
            _openCenter = CGPointMake(_contentOffset + self.frame.size.width / 2, self.frame.size.height / 2);
            _closeCenter = CGPointMake(_openCenter.x, (_triggerView.frame.size.height - _contentView.frame.size.height) / 2);
            
            _contentView.frame = CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height);
            _triggerView.frame = CGRectMake(_triggerOffset, _contentView.frame.size.height, _triggerView.frame.size.width, _triggerView.frame.size.height);
            break;
        case JWDrawerViewLocationBottom:
            self.frame = CGRectMake(_contentOffset, _parentView.frame.size.height - _triggerView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height + _triggerView.frame.size.height);
            _openCenter = CGPointMake(_contentOffset + self.frame.size.width / 2, _parentView.frame.size.height - self.frame.size.height / 2);
            _closeCenter = CGPointMake(_openCenter.x, _parentView.frame.size.height - _triggerView.frame.size.height + self.frame.size.height / 2);
            
            _contentView.frame = CGRectMake(0, _triggerView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height);
            _triggerView.frame = CGRectMake(_triggerOffset, 0, _triggerView.frame.size.width, _triggerView.frame.size.height);
            break;
        default:
            break;
    }
}

- (BOOL)beyondOpen:(CGPoint)translation
{
    switch (self.location) {
        case JWDrawerViewLocationLeft:
            return self.center.x + translation.x > _openCenter.x;
        case JWDrawerViewLocationRight:
            return self.center.x + translation.x < _openCenter.x;
        case JWDrawerViewLocationTop:
            return self.center.y + translation.y > _openCenter.y;
        case JWDrawerViewLocationBottom:
            return self.center.y + translation.y < _openCenter.y;
        default:
            break;
    }
}

- (BOOL)beyondClose:(CGPoint)translation
{
    switch (self.location) {
        case JWDrawerViewLocationLeft:
            return self.center.x + translation.x < _closeCenter.x;
        case JWDrawerViewLocationRight:
            return self.center.x + translation.x > _closeCenter.x;
        case JWDrawerViewLocationTop:
            return self.center.y + translation.y < _closeCenter.y;
        case JWDrawerViewLocationBottom:
            return self.center.y + translation.y > _closeCenter.y;
        default:
            break;
    }
}

- (BOOL)shouldOpen
{
    switch (self.location) {
        case JWDrawerViewLocationLeft:
            return self.center.x > _openCenter.x * OPEN_RATIO;
        case JWDrawerViewLocationRight:
            return self.center.x < _parentView.frame.size.width - (_parentView.frame.size.width - _openCenter.x) * OPEN_RATIO;
        case JWDrawerViewLocationTop:
            return self.center.y > _openCenter.y * OPEN_RATIO;
        case JWDrawerViewLocationBottom:
            return self.center.y < _parentView.frame.size.height - (_parentView.frame.size.height - _openCenter.y) * OPEN_RATIO;
        default:
            break;
    }
}

- (CGPoint)centerAfterTranslation:(CGPoint)translation
{
    switch (self.location) {
        case JWDrawerViewLocationLeft:
            return CGPointMake(self.center.x + translation.x, self.center.y);
        case JWDrawerViewLocationRight:
            return CGPointMake(self.center.x + translation.x, self.center.y);
        case JWDrawerViewLocationTop:
            return CGPointMake(self.center.x, self.center.y + translation.y);
        case JWDrawerViewLocationBottom:
            return CGPointMake(self.center.x, self.center.y + translation.y);
        default:
            break;
    }
}

@end
