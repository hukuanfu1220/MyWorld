//
//  CC_const.h
//  BSBDJ
//
//  Created by 陈诚 on 16/10/11.
//  Copyright © 2016年 陈诚. All rights reserved.
//  用来存放一些 不可改变 的常量

#import <Foundation/Foundation.h>

//UIKIT_EXTERN简单来说，就是将函数修饰为兼容以往C编译方式的、具有extern属性(文件外可见性)、public修饰的方法或变量库外仍可见的属性


/** Base URL  */
UIKIT_EXTERN NSString  * const baseURL;


/** taBBar 的高 */
UIKIT_EXTERN CGFloat const taBbarHight;

/** 导航栏 + 状态栏 的高 */
UIKIT_EXTERN CGFloat const navigationHight;


/** 导航栏 的高 */
UIKIT_EXTERN CGFloat const navigationAllHight;


/**标题 的高 */
UIKIT_EXTERN CGFloat const titleButtonHight;

/** 全局的边缘 */
UIKIT_EXTERN CGFloat const marginWidth;

/** 动画的时间 */
UIKIT_EXTERN CGFloat const animateDuration;

/** 高德地图Key */
UIKIT_EXTERN NSString * const  GDMapKey;






