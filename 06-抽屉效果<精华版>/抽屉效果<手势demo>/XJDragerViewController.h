//
//  XJDragerViewController.h
//  抽屉效果<手势demo>
//
//  Created by 李胜兵 on 16/9/28.
//  Copyright © 2016年 付公司. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, XJDragDirectionFrom) {
    XJDragDirectionFromDefault,              ///<默认左右滑动样式一样，高度都变化
    XJDragDirectionFromLeftToRight,          ///<从左到右滑动，显示视图高度不变
    XJDragDirectionFromRightToLeft,          ///<从右到左滑动，显示视图高度不变
    XJDragDirectionFromLeftAndRight          ///<左边和右边滑动，高度都不变
};



@interface XJDragerViewController : UIViewController
@property (nonatomic, strong,readonly)UIView *leftView;
@property (nonatomic, strong,readonly)UIView *mainView;
@property (nonatomic, strong,readonly)UIView *rightView;

/** 默认是左右滑动高度都变化*/
@property (nonatomic, assign)XJDragDirectionFrom direction;

/** 默认是100，正数和负数都可以设置，效果一样*/
@property (nonatomic, assign)CGFloat maxY;

/** 值：正数越大效果越明显，负数越小越明显*/
@property (nonatomic, assign)CGFloat xj_TargetRight;

/** 值：正数越大效果越明显，负数越小越明显*/
@property (nonatomic, assign)CGFloat xj_TargetLeft;
@end
