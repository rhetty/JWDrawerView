//
//  JWDrawerView.h
//  Version 1.0.0
//  Created by Jiawei Huang on 16/8/25.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JWDrawerViewLocation) {
  JWDrawerViewLocationLeft,
  JWDrawerViewLocationRight,
  JWDrawerViewLocationTop,
  JWDrawerViewLocationBottom
};

static const CGFloat kDistanceTimeRatio = 1200.0f;
static const CGFloat kOpenRatio = 0.3f;
static const CGFloat kDefaultContentOffsetRatio = 0.5f;
static const CGFloat kDefaultTriggerOffsetRatio = 0.382f;
static const CGFloat kMaskAlpha = 0.5f;

/**
 * Displays a drawer with content and trigger.
 * DOES NOT support rotation.
 * @note Instantiate with class methods instead of init.
 */
@interface JWDrawerView : UIView
{
  @protected
  UIView *_contentView;
  UIView *_triggerView;
  __weak UIView *_parentView;
  CGFloat _contentOffset;
  CGFloat _triggerOffset;
  CGPoint _openCenter;
  CGPoint _closeCenter;
}
/**
 * A property which controls the drawer to open or close.
 */
@property (nonatomic, assign, getter=isOpen) BOOL open;
/**
 * Creates a drawer, and adds it to provided view.
 * @param view The view that the drawer will be added to.
 * @param contentView The view that will be displayed in the drawer.
 * @param triggerView The view that will be displayed as a trigger.
 * @return A reference to the created drawer.
 */
+ (instancetype)addDrawerToView:(UIView *)view withContentView:(UIView *)contentView triggerView:(UIView *)triggerView;
/**
 * Creates a drawer, and adds it to provided view.
 * @param view The view that the drawer will be added to.
 * @param contentView The view that will be displayed in the drawer.
 * @param triggerView The view that will be displayed as a trigger.
 * @param location Where the drawer is located in screen
 * @param contentOffset The offset of content to the edge of provided view.
 * @param triggerOffset The offset of trigger to content.
 * @return A reference to the created drawer.
 */
+ (instancetype)addDrawerToView:(UIView *)view withContentView:(UIView *)contentView triggerView:(UIView *)triggerView location:(JWDrawerViewLocation)location contentOffset:(CGFloat)contentOffset triggerOffset:(CGFloat)triggerOffset withMask:(BOOL)withMask;
@end
