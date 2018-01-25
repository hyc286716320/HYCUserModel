//
//  MyUserData.m
//  HYCUserModel
//
//  Created by hyc on 2018/1/25.
//  Copyright © 2018年 hyc. All rights reserved.
//

#import "MyUserData.h"

@implementation MyUserData
+ (MyUserData *)sharedManager
{
    static MyUserData *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}
@end
