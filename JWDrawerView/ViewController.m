//
//  ViewController.m
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "ViewController.h"
#import "JWDrawerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    contentView.backgroundColor = [UIColor blackColor];
    UIView *triggerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
    triggerView.backgroundColor = [UIColor redColor];
    JWDrawerView *drawer = [[JWDrawerView alloc] initWithContentView:contentView contentOffset:0 triggerView:triggerView triggerOffset:100 parentView:self.view];
    drawer.location = JWDrawerViewLocationLeft;
    [self.view addSubview:drawer];
    
    
    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView2.backgroundColor = [UIColor blackColor];
    UIView *triggerView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    triggerView2.backgroundColor = [UIColor redColor];
    JWDrawerView *updrawer = [[JWDrawerView alloc] initWithContentView:contentView2 contentOffset:0 triggerView:triggerView2 triggerOffset:100 parentView:self.view];
    updrawer.location = JWDrawerViewLocationTop;
    [self.view addSubview:updrawer];

    
    UIView *contentView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    contentView3.backgroundColor = [UIColor blackColor];
    UIView *triggerView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
    triggerView3.backgroundColor = [UIColor redColor];
    JWDrawerView *rightdrawer = [[JWDrawerView alloc] initWithContentView:contentView3 contentOffset:0 triggerView:triggerView3 triggerOffset:100 parentView:self.view];
    rightdrawer.location = JWDrawerViewLocationRight;
    [self.view addSubview:rightdrawer];
    
    
    UIView *contentView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView4.backgroundColor = [UIColor blackColor];
    UIView *triggerView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    triggerView4.backgroundColor = [UIColor redColor];
    JWDrawerView *downdrawer = [[JWDrawerView alloc] initWithContentView:contentView4 contentOffset:0 triggerView:triggerView4 triggerOffset:100 parentView:self.view];
    downdrawer.location = JWDrawerViewLocationBottom;
    [self.view addSubview:downdrawer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
