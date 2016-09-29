//
//  MyViewController.m
//  抽屉效果<手势demo>
//
//  Created by 李胜兵 on 16/9/28.
//  Copyright © 2016年 付公司. All rights reserved.
//

#import "MyViewController.h"
#import "XJTableViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 当一个控制器的view添加到另外一个控制器上的view时候，那次是view所在的控制器也应该成为上一个控制器的子控制器才可以 <父子控制器>
    XJTableViewController *vc1 = [[XJTableViewController alloc] init];
    vc1.view.backgroundColor = [UIColor purpleColor];
    vc1.view.frame = self.mainView.frame;
    [self.mainView addSubview:vc1.view];
    [self addChildViewController:vc1];
    
    
    XJTableViewController *vc2 = [[XJTableViewController alloc] init];
    vc2.view.backgroundColor = [UIColor orangeColor];
    vc2.view.frame = self.mainView.frame;
    [self.leftView addSubview:vc2.view];
    [self addChildViewController:vc2];
    
    
    self.direction = XJDragDirectionFromLeftToRight;
    self.maxY = 150;
    self.xj_TargetLeft = 330000000000000;
    self.xj_TargetRight = -1234567890;
    
    // 备注：支持四种风格、支持任意设置数字大小，不受限制，想射就射
}


@end
