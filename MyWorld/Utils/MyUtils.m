//
//  MyUtils.m
//  MyWorld
//
//  Created by 胡宽富 on 2018/9/12.
//  Copyright © 2018年 胡宽富. All rights reserved.
//

#import "MyUtils.h"


@implementation MyUtils

- (void)registerUserWithUserName:(NSString *)username WithPassWord:(NSString *)password WithEmail:(NSString *)email{
    AVUser *user = [AVUser user];
    user.username = username;
    user.password = password;
    user.email = email;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
    }];
}
- (void)loginUserWithUserName:(NSString *)username WithPassWord:(NSString *)password{
    [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
        if (error) {
            NSLog(@"登录失败 %@", error);
        } else {
            
        }
    }];
}

@end
