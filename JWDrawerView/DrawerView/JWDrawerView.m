//
//  JWDrawerView.m
//  Version 1.0.0
//  Created by Jiawei Huang on 16/8/25.
//

#import "JWDrawerView.h"
#import "JWLeftDrawerView.h"
#import "JWRightDrawerView.h"
#import "JWTopDrawerView.h"
#import "JWBottomDrawerView.h"

#define JWMainThreadAssert() NSAssert([NSThread isMainThread], @"JWDrawerView needs to be accessed on the main thread.");
#define JWInheritAssert() NSAssert([self class] != [JWDrawerView class], @"JWDrawerView should not be instantiated. Please use (+) methods.");

@interface JWDrawerView()
@property (nonatomic, strong) UIButton *maskView;
@end

@implementation JWDrawerView

+ (instancetype)addDrawerToView:(UIView *)view withContentView:(UIView *)contentView triggerView:(UIView *)triggerView
{
  return [[self class] addDrawerToView:view withContentView:contentView triggerView:triggerView location:JWDrawerViewLocationLeft contentOffset:[[self class] defaultContentOffset:contentView view:view] triggerOffset:[[self class] defaultTriggerOffset:triggerView contentView:contentView] withMask:YES];
}

+ (instancetype)addDrawerToView:(UIView *)view withContentView:(UIView *)contentView triggerView:(UIView *)triggerView location:(JWDrawerViewLocation)location contentOffset:(CGFloat)contentOffset triggerOffset:(CGFloat)triggerOffset withMask:(BOOL)withMask
{
  if (!view || !contentView || !triggerView) {
    return nil;
  }
  
  JWDrawerView *drawer;
  switch (location) {
    case JWDrawerViewLocationRight:
      drawer = [[JWRightDrawerView alloc] init];
      break;
    case JWDrawerViewLocationTop:
      drawer = [[JWTopDrawerView alloc] init];
      break;
    case JWDrawerViewLocationBottom:
      drawer = [[JWBottomDrawerView alloc] init];
      break;
    default:
      drawer = [[JWLeftDrawerView alloc] init];
      break;
  }
  
  drawer->_parentView = view;
  drawer->_contentView = contentView;
  drawer->_triggerView = triggerView;
  drawer->_contentOffset = contentOffset;
  drawer->_triggerOffset = triggerOffset;
  if (withMask) {
    drawer->_maskView = [[UIButton alloc] initWithFrame:view.frame];
    drawer->_maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:kMaskAlpha];
    [drawer->_maskView addTarget:drawer action:@selector(maskPressed) forControlEvents:UIControlEventTouchUpInside];
  }
  
  drawer.backgroundColor = [UIColor clearColor];
  [drawer addSubview:contentView];
  [drawer addSubview:triggerView];
  
  drawer.userInteractionEnabled = YES;
  triggerView.userInteractionEnabled = YES;
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:drawer action:@selector(tapped)];
  [triggerView addGestureRecognizer:tap];
  UIGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:drawer action:@selector(pan:)];
  [triggerView addGestureRecognizer:pan];
  
  [drawer performSelector:@selector(layout)];
  drawer.open = NO;
  [view addSubview:drawer];
  [view bringSubviewToFront:drawer];
  
  return drawer;
}

#pragma mark -

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
  CGPoint pointInTrigger = [self convertPoint:point toView:_triggerView];
  if ([_triggerView pointInside:pointInTrigger withEvent:event]) {
    return _triggerView;
  } else {
    CGPoint pointInContent = [self convertPoint:point toView:_contentView];
    if ([_contentView pointInside:pointInContent withEvent:event]) {
      return [_contentView hitTest:pointInContent withEvent:event];
    } else {
      return nil;
    }
  }
}

- (void)maskPressed
{
  self.open = NO;
}

- (void)tapped
{
  self.open = !self.isOpen;
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
  JWMainThreadAssert()
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
    self.open = [self shouldOpen];
  }
}

- (void)setOpen:(BOOL)open
{
  JWMainThreadAssert()
  if (open) {
    _contentView.hidden = NO;
    [_parentView bringSubviewToFront:self];
  }
  [UIView animateWithDuration:[self animationIntervalToOpen:open]
                        delay:0
                      options:UIViewAnimationOptionCurveLinear
                   animations:^{
                     self.center = open ? _openCenter : _closeCenter;
                   } completion:^(BOOL finished) {
                     if (finished) {
                       _open = open;
                       if (!_open) {
                         _contentView.hidden = YES;
                         [self.maskView removeFromSuperview];
                       } else {
                         [_parentView addSubview:self.maskView];
                         [_parentView bringSubviewToFront:self];
                       }
                     }
                   }];
}

#pragma mark - To be implemented

+ (CGFloat)defaultContentOffset:(UIView *)contentView view:(UIView *)view
{
  JWInheritAssert()
  return 0;
}

+ (CGFloat)defaultTriggerOffset:(UIView *)triggerView contentView:(UIView *)contentView
{
  JWInheritAssert()
  return 0;
}

- (void)layout
{
  JWInheritAssert()
}

- (NSTimeInterval)animationIntervalToOpen:(BOOL)toOpen
{
  JWInheritAssert()
  return 0;
}

- (BOOL)beyondOpen:(CGPoint)translation
{
  JWInheritAssert()
  return NO;
}

- (BOOL)beyondClose:(CGPoint)translation
{
  JWInheritAssert()
  return NO;
}

- (BOOL)shouldOpen
{
  JWInheritAssert()
  return NO;
}

- (CGPoint)centerAfterTranslation:(CGPoint)translation
{
  JWInheritAssert()
  return CGPointZero;
}

@end
