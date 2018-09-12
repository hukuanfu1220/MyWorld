//
//  WF_TabBarController.m
//  WF
//
//  Created by 陈诚 on 2018/7/3.
//  Copyright © 2018年 chen cheng. All rights reserved.
//

#import "WF_TabBarController.h"

#import "WF_NavigationController.h"
#import "AppDelegate.h"

#import "HomeViewController.h"
#import "MineViewController.h"


@interface WF_TabBarController ()<UITabBarControllerDelegate>
@property (nonatomic,assign)BOOL test;
@property (nonatomic,assign)BOOL dev;
@end

@implementation WF_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    self.delegate = self;
    
    self.tabBarItem.image=[[UIImage imageNamed:@"tabbar-light"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self CreatChildController];
}

- (void)CreatChildController{
    
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addChileController:home withTitle:@"首页" ImageName:@"首页" secImageName:@"首页选中"];
    
    
    MineViewController *mine = [[MineViewController alloc]init];
    [self addChileController:mine withTitle:@"我的" ImageName:@"我的" secImageName:@"我的选中"];
    
}
- (void)addChileController:(UIViewController *)childController withTitle:(NSString*)title ImageName:(NSString *)ImageName secImageName :(NSString *)selectImageString{
    
    
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:ImageName];
    
    
    
#pragma mark -------------------- CC Mark -----------------
#pragma mark ios 7之后苹果默认会给我们图片渲染。处理方法： 1.代码设置  2.直接取消图片的默认渲染
    
    /*
     UIImage *iamge = [UIImage imageNamed:selectImageString];
     iamge = [iamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     
     childController.tabBarItem.selectedImage = iamge;
     */
    //    --------- cc 注意这里 设置选中图片的时候
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageString]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11.5];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = RGBACOLOR(153,246,254,1);
    selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11.5];

    [childController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    
    
    WF_NavigationController *navigationVC = [[WF_NavigationController alloc]initWithRootViewController:childController];
    
    
    [self addChildViewController:navigationVC];
    
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    //NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    
    return YES;
}




-(void)closeVC{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    WF_TabBarController *tabViewController = (WF_TabBarController *) appDelegate.window.rootViewController;
    
    [tabViewController setSelectedIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
