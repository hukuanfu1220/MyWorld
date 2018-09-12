//
//  MyUtils.h
//  MyWorld
//
//  Created by 胡宽富 on 2018/9/12.
//  Copyright © 2018年 胡宽富. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUtils : NSObject

-(void)registerUserWithUserName:(NSString *)username WithPassWord:(NSString *)password WithEmail:(NSString *)email;
-(void)loginUserWithUserName:(NSString *)username WithPassWord:(NSString *)password;

@end
