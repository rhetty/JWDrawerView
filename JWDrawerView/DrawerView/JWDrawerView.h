//
//  JWDrawerView.h
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

#define OPEN_RATIO 1/3

typedef NS_ENUM(NSInteger, JWDrawerViewLocation) {
    JWDrawerViewLocationLeft,
    JWDrawerViewLocationRight,
    JWDrawerViewLocationTop,
    JWDrawerViewLocationBottom
};

@interface JWDrawerView : UIView

@property (nonatomic, assign, getter=isOpen) BOOL open;
@property (nonatomic, assign) JWDrawerViewLocation location;

- (instancetype)initWithContentView:(UIView *)contentView contentOffset:(CGFloat)contentOffset triggerView:(UIView *)triggerView triggerOffset:(CGFloat)triggerOffset parentView:(UIView *)parentView;

@end
