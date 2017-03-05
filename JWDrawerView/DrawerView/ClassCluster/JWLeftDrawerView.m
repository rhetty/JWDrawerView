//
//  JWLeftDrawerView.m
//

#import "JWLeftDrawerView.h"

@implementation JWLeftDrawerView

+ (CGFloat)defaultContentOffset:(UIView *)contentView view:(UIView *)view
{
  return (view.frame.size.height - contentView.frame.size.height) * kDefaultContentOffsetRatio;
}

+ (CGFloat)defaultTriggerOffset:(UIView *)triggerView contentView:(UIView *)contentView
{
  return (contentView.frame.size.height - triggerView.frame.size.height) * kDefaultTriggerOffsetRatio;
}

- (void)layout
{
  self.frame = CGRectMake(-_contentView.frame.size.width, _contentOffset, _contentView.frame.size.width + _triggerView.frame.size.width, _contentView.frame.size.height);
  _openCenter = CGPointMake(self.frame.size.width / 2, _contentOffset + self.frame.size.height / 2);
  _closeCenter = CGPointMake((_triggerView.frame.size.width - _contentView.frame.size.width) / 2, _openCenter.y);
  
  _contentView.frame = CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height);
  _triggerView.frame = CGRectMake(_contentView.frame.size.width, _triggerOffset, _triggerView.frame.size.width, _triggerView.frame.size.height);
}

- (NSTimeInterval)animationIntervalToOpen:(BOOL)toOpen
{
  return (toOpen ? (_openCenter.x - self.center.x) : (self.center.x - _closeCenter.x)) / kDistanceTimeRatio;
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
  return self.center.x > _openCenter.x * kOpenRatio;
}

- (CGPoint)centerAfterTranslation:(CGPoint)translation
{
  return CGPointMake(self.center.x + translation.x, self.center.y);
}

@end
