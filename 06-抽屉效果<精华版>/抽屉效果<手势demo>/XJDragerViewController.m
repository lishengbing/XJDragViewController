//
//  XJDragerViewController.m
//  抽屉效果<手势demo>
//
//  Created by 李胜兵 on 16/9/28.
//  Copyright © 2016年 付公司. All rights reserved.
//  github链接： https://github.com/lishengbing/XJDragViewController

#import "XJDragerViewController.h"
#define XJScreenW [UIScreen mainScreen].bounds.size.width
#define XJScreenH [UIScreen mainScreen].bounds.size.height


@interface XJDragerViewController ()

@end

@implementation XJDragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDefalutValue];
    [self setupUI];
    [self addGestures];
}

#pragma mark - 点击手势事件处理
- (void)tap:(UIGestureRecognizer *)ges {
    [UIView animateWithDuration:0.5 animations:^{
        self.mainView.frame = self.view.frame;
    }];
}

#pragma mark - 拖动手势事件处理
- (void)pan:(UIPanGestureRecognizer *)panGes {
    CGPoint transP = [panGes translationInView:self.mainView];
    self.mainView.frame = [self frameWithoffsetX:transP.x];
    
    if (self.mainView.frame.origin.x > 0) {
        self.rightView.hidden = YES;
    }else if(self.mainView.frame.origin.x < 0){
        self.rightView.hidden = NO;
    }
    
    CGFloat target = 0;
    if (panGes.state == UIGestureRecognizerStateEnded) {
        if (self.mainView.frame.origin.x > XJScreenW *0.5) {
            target = self.xj_TargetRight;
        }else if (CGRectGetMaxX(self.mainView.frame) < XJScreenW *0.5) {
            target = self.xj_TargetLeft;
        }
    
        CGFloat offset = target - self.mainView.frame.origin.x;
        [UIView animateWithDuration:0.25 animations:^{
            self.mainView.frame = [self frameWithoffsetX:offset];
        }];
    }
    
    [panGes setTranslation:CGPointZero inView:self.mainView];
}

#pragma mark - 根据偏移量计算Main frame
- (CGRect)frameWithoffsetX:(CGFloat)offsetX {
    CGRect frame = self.mainView.frame;
    frame.origin.x += offsetX;

    CGFloat  maxOffsetY = [self changeStyleWithDirection:_direction];
    frame.origin.y =  fabs(frame.origin.x * maxOffsetY / XJScreenW);

    frame.size.height = XJScreenH - 2*frame.origin.y;
    return frame;
}

#pragma mark -  根据不同样式展示不同风格
- (CGFloat)changeStyleWithDirection:(XJDragDirectionFrom)type {
    CGFloat maxOffsetY = self.maxY;
    
    if (self.mainView.frame.origin.x > 0) {
        if (type == XJDragDirectionFromLeftToRight ||  type ==XJDragDirectionFromLeftAndRight) {
           maxOffsetY = 0;
        }
    }else if(self.mainView.frame.origin.x < 0){
        if (type == XJDragDirectionFromRightToLeft || type ==XJDragDirectionFromLeftAndRight) {
           maxOffsetY = 0;
        }
    }
    return maxOffsetY;
}

#pragma mark - 设置默认值
- (void)setupDefalutValue {
    self.maxY = self.maxY ? self.maxY : 100;
    self.xj_TargetLeft = self.xj_TargetLeft ? self.xj_TargetLeft : 300;
    self.xj_TargetRight = self.xj_TargetRight ? self.xj_TargetRight : -300;
}

#pragma mark - 设置UI
- (void)setupUI {
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor blueColor];
    _leftView = leftView;
    [self.view addSubview:leftView];
    
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor greenColor];
    _rightView = rightView;
    [self.view addSubview:rightView];
    
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    _mainView = mainView;
    [self.view addSubview:mainView];
}

#pragma mark - 添加手势
- (void)addGestures {
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainView addGestureRecognizer:panGes];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGes];
}

#pragma mark - set方法
- (void)setMaxY:(CGFloat)maxY {
    _maxY = maxY;
}

- (void)setXj_TargetLeft:(CGFloat)xj_TargetLeft {
    CGFloat targetLeft = 0;
    if (fabs(xj_TargetLeft) > XJScreenW) {
        targetLeft = -XJScreenW+40;
    }else {
        targetLeft = -fabs(xj_TargetLeft);
    }
    _xj_TargetLeft = targetLeft;
}

- (void)setXj_TargetRight:(CGFloat)xj_TargetRight {
    CGFloat targetRight = 0;
    if (fabs(xj_TargetRight) > XJScreenW) {
        targetRight = XJScreenW-40;
    }else {
        targetRight = fabs(xj_TargetRight);
    }
    _xj_TargetRight = targetRight;
}

@end
