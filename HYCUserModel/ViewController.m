//
//  ViewController.m
//  HYCUserModel
//
//  Created by hyc on 2018/1/25.
//  Copyright © 2018年 hyc. All rights reserved.
//

#import "ViewController.h"
#import "MyUserData.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)addData:(id)sender {
    [MyUserData setHYCModelDict:@{
                                  @"userName":@"HYC",
                                  @"ages":@18,
                                  @"work":@"iOS",
                                  //@"isHaveGirlFriend":@NO
                                  }];
    [self GoOnTextView];
}

- (IBAction)removeData:(id)sender {
    [MyUserData removeHYCModelAllObject];
    [self GoOnTextView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    [self GoOnTextView];
}
- (BOOL)GoOnTextView{
    self.TV.text = [NSString stringWithFormat:@"\n姓名-->%@\n\n工作-->%@\n\n年龄-->%zd\n\n女朋友?->%d\n",
                    MyUserDataH.userName,
                    MyUserDataH.work,
                    MyUserDataH.ages,
                    MyUserDataH.isHaveGirlFriend
                    ];
    return self.TV.text.length;
}
@end
