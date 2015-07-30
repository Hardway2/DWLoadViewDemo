//
//  ViewController.m
//  DWLoadViewDemo
//
//  Created by hedawei on 15/7/29.
//  Copyright (c) 2015年 hedawei. All rights reserved.
//

#import "ViewController.h"
#import "DWLoadView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)load {
    __weak typeof(self) weakSelf = self;
    [DWLoadView loadViewWithType:DWLoadingView onSuperView:self.view];
    
    // 模拟延迟加载数据，3秒后调用（真实开发中，移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DWLoadView removeDWLoadViewOnSuperView:weakSelf.view];
    });
}

- (IBAction)noContentAction {
    __weak typeof(self) weakSelf = self;
    [DWLoadView loadViewWithType:DWLoadingView onSuperView:self.view];
    
    // 模拟延迟加载数据，3秒后调用（真实开发中，移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DWLoadView loadViewWithType:DWNoContentView onSuperView:weakSelf.view];
        
        //3秒后移除视图（真实开发中，不需要调用）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DWLoadView removeDWLoadViewOnSuperView:weakSelf.view];
        });
    });
}

- (IBAction)noNetAction {
    __weak typeof(self) weakSelf = self;
    [DWLoadView loadViewWithType:DWLoadingView onSuperView:self.view];
    
    // 模拟延迟加载数据，3秒后调用（真实开发中，移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DWLoadView *loadView = [DWLoadView loadViewWithType:DWNoNetView onSuperView:weakSelf.view];
        [loadView.reloadButton addTarget:weakSelf action:@selector(reloadAction) forControlEvents:UIControlEventTouchUpInside];
        
        //3秒后移除视图（真实开发中，不需要调用）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DWLoadView removeDWLoadViewOnSuperView:weakSelf.view];
        });
    });
}

- (void)reloadAction{
    //这里可以写重新请求的代码
    NSLog(@"重新加载");
}

@end
