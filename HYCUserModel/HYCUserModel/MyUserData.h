//
//  MyUserData.h
//  HYCUserModel
//
//  Created by hyc on 2018/1/25.
//  Copyright © 2018年 hyc. All rights reserved.
//

#import "HYCUserModel.h"
#define MyUserDataH [MyUserData sharedManager]
@interface MyUserData : HYCUserModel

@property (nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString *work;
@property (nonatomic,assign)NSInteger ages;
@property (nonatomic,assign)BOOL isHaveGirlFriend;

+ (MyUserData *)sharedManager;
@end
