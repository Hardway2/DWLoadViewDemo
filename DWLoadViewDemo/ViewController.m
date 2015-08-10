//
//  ViewController.m
//  DWLoadViewDemo
//
//  Created by hedawei on 15/7/29.
//  Copyright (c) 2015年 hedawei. All rights reserved.
//

#import "ViewController.h"
#import "DWLoadView.h"

@interface ViewController ()<DWLoadViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)load {
    __weak typeof(self) weakSelf = self;
    [DWLoadView loadViewWithType:DWLoadingView onSuperView:self.view WithDelegate:nil];
    
    // 模拟延迟加载数据，2秒后调用（实际开发中，移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DWLoadView removeDWLoadViewOnSuperView:weakSelf.view];
    });
}

- (IBAction)noContentAction {
    __weak typeof(self) weakSelf = self;
    [DWLoadView loadViewWithType:DWLoadingView onSuperView:self.view WithDelegate:nil];
    
    // 模拟延迟加载数据，3秒后调用（实际开发中，移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DWLoadView loadViewWithType:DWNoContentView onSuperView:weakSelf.view WithDelegate:nil];
        
        //2秒后移除视图
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DWLoadView removeDWLoadViewOnSuperView:weakSelf.view];
        });
    });
}

- (IBAction)noNetAction {
    __weak typeof(self) weakSelf = self;
    [DWLoadView loadViewWithType:DWLoadingView onSuperView:self.view WithDelegate:nil];
    
    // 模拟延迟加载数据，3秒后调用（实际开发中，移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DWLoadView loadViewWithType:DWNoNetView onSuperView:weakSelf.view WithDelegate:weakSelf];
        
        //2秒后移除视图
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DWLoadView removeDWLoadViewOnSuperView:weakSelf.view];
        });
    });
}

- (void)loadViewButtonClick{

    //这里可以写重新请求网络的代码
    NSLog(@"点击重新加载按钮");
}

@end
