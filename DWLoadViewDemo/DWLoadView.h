//
//  DWLoadView.h
//  DWLoadViewDemo
//
//  Created by hedawei on 15/7/29.
//  Copyright (c) 2015年 hedawei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DWLoadViewType) {
    /**正在加载视图*/
    DWLoadingView,
    /**暂无内容视图*/
    DWNoContentView,
    /**没网络视图*/
    DWNoNetView
};

@interface DWLoadView : UIView
/**加载视图类别*/
@property (nonatomic, assign) DWLoadViewType viewType;
/**没网情况下重新加载按钮*/
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
/**加载视图*/
+(instancetype)loadViewWithType:(DWLoadViewType)viewType onSuperView:(UIView *)superView;
/**移除视图*/
+(void)removeDWLoadViewOnSuperView:(UIView *)superView;
@end
