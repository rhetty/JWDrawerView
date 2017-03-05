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
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, self.view.frame.size.height)];
    contentView.backgroundColor = [UIColor blackColor];
    UIView *triggerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
    triggerView.backgroundColor = [UIColor redColor];
    [JWDrawerView addDrawerToView:self.view
                  withContentView:contentView
                      triggerView:triggerView
                         location:JWDrawerViewLocationLeft
                    contentOffset:0
                    triggerOffset:150
                         withMask:NO];
    
    
    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView2.backgroundColor = [UIColor blackColor];
    UIView *triggerView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    triggerView2.backgroundColor = [UIColor redColor];
    [JWDrawerView addDrawerToView:self.view
                  withContentView:contentView2
                      triggerView:triggerView2
                         location:JWDrawerViewLocationTop
                    contentOffset:0
                    triggerOffset:100
                         withMask:YES];

    
    UIView *contentView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    contentView3.backgroundColor = [UIColor blackColor];
    UIView *triggerView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 80)];
    triggerView3.backgroundColor = [UIColor redColor];
    [JWDrawerView addDrawerToView:self.view
                  withContentView:contentView3
                      triggerView:triggerView3
                         location:JWDrawerViewLocationRight
                    contentOffset:0
                    triggerOffset:200
                         withMask:YES];

    
    UIView *contentView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView4.backgroundColor = [UIColor blackColor];
    UIView *triggerView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    triggerView4.backgroundColor = [UIColor redColor];
    [JWDrawerView addDrawerToView:self.view
                  withContentView:contentView4
                      triggerView:triggerView4
                         location:JWDrawerViewLocationBottom
                    contentOffset:0
                    triggerOffset:100
                         withMask:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
