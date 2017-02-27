//
//  JWBottomDrawerView.m
//

#import "JWBottomDrawerView.h"

@implementation JWBottomDrawerView

+ (CGFloat)defaultContentOffset:(UIView *)contentView view:(UIView *)view
{
  return (view.frame.size.width - contentView.frame.size.width) * kDefaultContentOffsetRatio;
}

+ (CGFloat)defaultTriggerOffset:(UIView *)triggerView contentView:(UIView *)contentView
{
  return (contentView.frame.size.width - triggerView.frame.size.width) * kDefaultTriggerOffsetRatio;
}

- (void)layout
{
  self.frame = CGRectMake(_contentOffset, _parentView.frame.size.height - _triggerView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height + _triggerView.frame.size.height);
  _openCenter = CGPointMake(_contentOffset + self.frame.size.width / 2, _parentView.frame.size.height - self.frame.size.height / 2);
  _closeCenter = CGPointMake(_openCenter.x, _parentView.frame.size.height - _triggerView.frame.size.height + self.frame.size.height / 2);
  
  _contentView.frame = CGRectMake(0, _triggerView.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height);
  _triggerView.frame = CGRectMake(_triggerOffset, 0, _triggerView.frame.size.width, _triggerView.frame.size.height);
}

- (NSTimeInterval)animationIntervalToOpen:(BOOL)toOpen
{
  return (toOpen ? (self.center.y - _openCenter.y) : (_closeCenter.y - self.center.y)) / kDistanceTimeRatio;
}

- (BOOL)beyondOpen:(CGPoint)translation
{
  return self.center.y + translation.y < _openCenter.y;
}

- (BOOL)beyondClose:(CGPoint)translation
{
  return self.center.y + translation.y > _closeCenter.y;
}

- (BOOL)shouldOpen
{
  return self.center.y < _parentView.frame.size.height - (_parentView.frame.size.height - _openCenter.y) * kOpenRatio;
}

- (CGPoint)centerAfterTranslation:(CGPoint)translation
{
  return CGPointMake(self.center.x, self.center.y + translation.y);
}

@end
