//
//  LBUserLeadView.h
//
//  Created by 刘彬 on 2016/6/24.
//  Copyright © 2016 刘彬 All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,LBLeadHighlightType){//高亮类型
    LBLeadHighlightTypeCircle,//圆形
    LBLeadHighlightTypeRect  //矩形
};

@interface LBUserLeadView : UIView
@property (nonatomic, weak) UIView *lb_customView;//自定义view，位置任意摆放

@property (nonatomic, assign) CGRect lb_sourceRect;
@property (nonatomic, assign) BOOL lb_canOverlapSourceRect;
@property (nonatomic, assign) LBLeadHighlightType lb_lightType;

/**
 直接调用类方法展示新手引导界面
 
 @param addedView 显示目的view
 @param handler 点击引导的回调
 */
- (void )showLeadInView:(UIView *)addedView completionHandler:(nullable void(^)(void))handler;

@end

NS_ASSUME_NONNULL_END
