# XJDragViewController
强大的抽屉效果的类



![XJDmain](https://github.com/lishengbing/XJDragViewController/blob/master/06-%E6%8A%BD%E5%B1%89%E6%95%88%E6%9E%9C%3C%E7%B2%BE%E5%8D%8E%E7%89%88%3E/a1.gif)

![XJDmain](https://github.com/lishengbing/XJDragViewController/blob/master/06-%E6%8A%BD%E5%B1%89%E6%95%88%E6%9E%9C%3C%E7%B2%BE%E5%8D%8E%E7%89%88%3E/a2.gif)




使用：
1:导入：#import "XJDragerViewController.h"

2:创建一个自己的控制器继承自XJDragerViewController控制器

3:添加范例01：
XJTableViewController *vc1 = [[XJTableViewController alloc] init];
vc1.view.backgroundColor = [UIColor purpleColor];
vc1.view.frame = self.mainView.frame;
[self.mainView addSubview:vc1.view];
[self addChildViewController:vc1];

4:设置相关参数（属性）：
self.direction = XJDragDirectionFromDefault;
self.maxY = 150;
self.xj_TargetLeft = 330000000000000;
self.xj_TargetRight = -1234567890;


搞定:
备注：支持四种风格、支持任意设置数字大小，不受限制，想射就射


github相关链接： https://github.com/lishengbing/XJDragViewController

git.oschina链接:   https://my.oschina.net/shengbingli/blog/edit
