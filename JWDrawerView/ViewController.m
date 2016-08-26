//
//  ViewController.m
//  JWDrawerView
//
//  Created by 黄嘉伟 on 16/8/25.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "ViewController.h"
#import "JWUpDrawerView.h"
#import "JWLeftDrawerView.h"
#import "JWRightDrawerView.h"
#import "JWDownDrawerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    contentView.backgroundColor = [UIColor blackColor];
    
    UIView *toggleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    toggleView.backgroundColor = [UIColor redColor];
    
    JWLeftDrawerView *drawer = [[JWLeftDrawerView alloc] initWithContentView:contentView contentOffset:0 toggleView:toggleView toggleOffset:100 parentView:self.view];
    [self.view addSubview:drawer];
    
    
    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView2.backgroundColor = [UIColor blackColor];
    
    UIView *toggleView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    toggleView2.backgroundColor = [UIColor redColor];
    
    JWUpDrawerView *updrawer = [[JWUpDrawerView alloc] initWithContentView:contentView2 contentOffset:0 toggleView:toggleView2 toggleOffset:100 parentView:self.view];
    [self.view addSubview:updrawer];
    
    
    UIView *contentView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    contentView3.backgroundColor = [UIColor blackColor];
    
    UIView *toggleView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    toggleView3.backgroundColor = [UIColor redColor];
    
    JWRightDrawerView *rightdrawer = [[JWRightDrawerView alloc] initWithContentView:contentView3 contentOffset:0 toggleView:toggleView3 toggleOffset:100 parentView:self.view];
    [self.view addSubview:rightdrawer];
    
    
    UIView *contentView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    contentView4.backgroundColor = [UIColor blackColor];
    
    UIView *toggleView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    toggleView4.backgroundColor = [UIColor redColor];
    
    JWDownDrawerView *downdrawer = [[JWDownDrawerView alloc] initWithContentView:contentView4 contentOffset:0 toggleView:toggleView4 toggleOffset:100 parentView:self.view];
    [self.view addSubview:downdrawer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
