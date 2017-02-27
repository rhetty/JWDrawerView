//
//  ViewController.m
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "ViewController.h"
#import "JWRightDrawerView.h"
#import "JWLeftDrawerView.h"
#import "JWTopDrawerView.h"
#import "JWBottomDrawerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, self.view.frame.size.height)];
    contentView.backgroundColor = [UIColor blackColor];
    UIView *triggerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
    triggerView.backgroundColor = [UIColor redColor];
    [JWLeftDrawerView addDrawerToView:self.view withContentView:contentView triggerView:triggerView];
    
    
    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView2.backgroundColor = [UIColor blackColor];
    UIView *triggerView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    triggerView2.backgroundColor = [UIColor redColor];
    [JWTopDrawerView addDrawerToView:self.view withContentView:contentView2 triggerView:triggerView2];

    
    UIView *contentView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    contentView3.backgroundColor = [UIColor blackColor];
    UIView *triggerView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
    triggerView3.backgroundColor = [UIColor redColor];
    [JWRightDrawerView addDrawerToView:self.view withContentView:contentView3 triggerView:triggerView3];

    
    UIView *contentView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView4.backgroundColor = [UIColor blackColor];
    UIView *triggerView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    triggerView4.backgroundColor = [UIColor redColor];
    [JWBottomDrawerView addDrawerToView:self.view withContentView:contentView4 triggerView:triggerView4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
