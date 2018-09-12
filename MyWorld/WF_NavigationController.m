//
//  WF_NavigationController.m
//  WF
//
//  Created by 陈诚 on 2018/7/3.
//  Copyright © 2018年 chen cheng. All rights reserved.
//

#import "WF_NavigationController.h"

@interface WF_NavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong)UIPanGestureRecognizer *pan;
@property (nonatomic,strong)UIScreenEdgePanGestureRecognizer *screenEdgeGesOut;



@end

@implementation WF_NavigationController

+ (void)load{
    
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:15.f];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    
    // 设置 导航条背景图片 (这样导航栏 就不是透明的了 。 注意 ： 必须是  UIBarMetricsDefault )
    
    //    UIImage *image = [UIImage imageOriginalWithName:@"bar"];
    
    //gq[navBar setBackgroundImage:[UIImage imageOriginalWithName:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    navBar.barTintColor = RGBACOLOR(10,24,61,1);
    
    navBar.tintColor = [UIColor whiteColor];
    
    [navBar setTitleTextAttributes:textAttrs];
    
}

#pragma mark -------------------- CC Mark -----------------
#pragma mark 注意：iOS 7之后默认设置了导航栏之后 默认会有一个 手势滑动返回。这里我们重写了back返回方法就没有了
/**
 
 // 恢复滑动返回功能 -> 分析:把系统的返回按钮覆盖 -> 1.手势失效(1.手势被清空 2.可能手势代理做了一些事情,导致手势失效)
 
 */

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        /**
         用自定义的 UIBarButtonItem 替换 navigationController 的 backBarButtonItem 记住backBarButtonItem 而不是 leftBarButtonItem ，如果你不小心替换成了 leftBarButtonItem ，那么会直接导致侧滑手势失效。
         */
        viewController.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arr_l"]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
        
    }
    
    [super pushViewController:viewController animated:animated];
    
    
}


- (void)back{
    
    [self popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];


    id target = self.interactivePopGestureRecognizer.delegate;
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    
    
    self.screenEdgeGesOut = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:target action:handler];
    self.screenEdgeGesOut.edges = UIRectEdgeLeft;
    self.screenEdgeGesOut.delegate = self;
    
    UIView *targetView = self.interactivePopGestureRecognizer.view;
    [targetView addGestureRecognizer:self.screenEdgeGesOut];
    
    
    // 关闭边缘触发手势 防止和原有边缘手势冲突
    [self.interactivePopGestureRecognizer setEnabled:NO];


}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    
    return (self.topViewController !=[self.viewControllers firstObject]);
}

//  防止导航控制器只有一个rootViewcontroller时触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count == 1 ? NO : YES;
}

#pragma mark -------------------- CC Mark -----------------
#pragma mark UIGestureRecognizerDelegate

// 决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // NSLog(@"self.childViewControllers--> %@",self.childViewControllers);
    //解决筛选也bug
    for (UIViewController *controller in self.childViewControllers) {
        if ([controller isKindOfClass:[UINavigationController class]]) {
            return NO;
        }
    }
    
    //因为根控制器不需要滑动返回
    return self.childViewControllers.count > 1;
    
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
