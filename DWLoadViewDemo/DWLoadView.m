//
//  DWLoadView.m
//  DWLoadViewDemo
//
//  Created by hedawei on 15/7/29.
//  Copyright (c) 2015年 hedawei. All rights reserved.
//

#define LoadView [[NSBundle mainBundle]loadNibNamed:@"DWLoadView" owner:self options:nil][0]

#import "DWLoadView.h"

@interface DWLoadView()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
@end

@implementation DWLoadView
+(void)loadViewWithType:(DWLoadViewType)viewType onSuperView:(UIView *)superView WithDelegate:(id<DWLoadViewDelegate>)delegate{
    //移除之前的加载视图
    [self removeDWLoadViewOnSuperView:superView];
    
    DWLoadView *loadView = LoadView;
    loadView.frame = [UIScreen mainScreen].bounds;
    loadView.delegate = delegate;
    switch (viewType) {
        case DWLoadingView:{
            loadView.activityView.hidden = NO;
            loadView.label.hidden = YES;
            loadView.reloadButton.hidden = YES;
        }
            break;
        case DWNoContentView:{
            loadView.activityView.hidden = YES;
            loadView.label.hidden = NO;
            loadView.reloadButton.hidden = YES;
        }
            break;
        default:{
            loadView.activityView.hidden = YES;
            loadView.label.hidden = YES;
            loadView.reloadButton.hidden = NO;
        }
            break;
    }
    [superView addSubview:loadView];
}

+(void)removeDWLoadViewOnSuperView:(UIView *)superView{
    
    for (UIView *view in superView.subviews) {
        if ([view isKindOfClass:[DWLoadView class]]) {
            [view removeFromSuperview];
        }
    }
}

- (IBAction)buttonClick {
    
    if([_delegate respondsToSelector:@selector(loadViewButtonClick)]){
        [_delegate loadViewButtonClick];
    }
}

@end
