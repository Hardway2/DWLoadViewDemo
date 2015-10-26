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

@protocol DWLoadViewDelegate <NSObject>

@optional
/**点击重新加载*/
- (void)loadViewButtonClick;

@end

@interface DWLoadView : UIView
@property (nonatomic, weak) id<DWLoadViewDelegate> delegate;

/**加载视图*/
+(void)loadViewWithType:(DWLoadViewType)viewType onSuperView:(UIView *)superView WithDelegate:(id<DWLoadViewDelegate>)delegate;
/**移除视图*/
+(void)removeDWLoadViewOnSuperView:(UIView *)superView;

@end
