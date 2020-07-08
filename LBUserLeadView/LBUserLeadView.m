//
//  LBUserLeadView.m
//
//  Created by 刘彬 on 2016/6/24.
//  Copyright © 2016 刘彬 All rights reserved.
//

#import "LBUserLeadView.h"


@interface LBUserLeadView ()
@property (nonatomic, strong) CALayer *coverLayer;
@property (nonatomic,copy)void(^callBack)(void);//点击回调
@end

@implementation LBUserLeadView
- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CALayer *coverLayer = [[CALayer alloc] init];
        coverLayer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
        [self.layer addSublayer:coverLayer];
        _coverLayer = coverLayer;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //!< 创建path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    //!< 宽高和中心点
    CGFloat width = _lb_sourceRect.size.width;
    CGFloat height = _lb_sourceRect.size.height;
    
    CGPoint center = CGPointMake(CGRectGetMidX(_lb_sourceRect), CGRectGetMidY(_lb_sourceRect));
    
    //!< 根据高亮的类型添加不同的path
    if (_lb_lightType == LBLeadHighlightTypeRect)
    {
        //矩形
        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:_lb_sourceRect cornerRadius:5] bezierPathByReversingPath]];
    }else
    {
        CGFloat radius = width == height ? width * 0.5: MIN(width, height) * 0.5;
        //圆形
        [path appendPath:[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:NO]];
    }

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    _coverLayer.mask = shapeLayer;
}

-(void)showLeadInView:(UIView *)addedView completionHandler:(void (^)(void))handler
{
    _callBack = handler;
    
    self.frame = addedView.bounds;
    _coverLayer.frame = self.bounds;
    if (_lb_customView)[self addSubview:_lb_customView];
    
    [self layoutSubviews];
    
    [addedView addSubview:self];
}


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    
    UIView *hitView = [super hitTest:point withEvent:event];
    if (self.lb_canOverlapSourceRect && CGRectContainsPoint(self.lb_sourceRect, point)) {
        [self touchesBegan:[NSSet setWithObject:[UITouch new]] withEvent:nil];
        
        return self.superview;
    }
    return hitView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
    if (self.callBack)self.callBack();
}

@end
