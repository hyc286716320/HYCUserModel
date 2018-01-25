# HYCUserModel
利用用户偏好设置存储用户重要信息,登陆信息等重要信息,使用方法简单,数据准确
需要在创建model 的时候继承HYCUserModel,然后需要在自己model里面声明并实现单例方法
## podfile
To integrate HYCUserModel into your Xcode project using CocoaPods, specify it in your Podfile:

`$ pod 'HYCUserModel'`

or

`pod 'HYCUserModel', '~> 1.0'`

Then, run the following command:

`$ pod install`

# Usage
## 使用前准备工作

  1. 存储用户信息的模型只能创建一个
  
  2. 创建的模型需要继承HYCUserModel后使用
  
  3. 需要给给创建的模型实现单例方法并声明出来,并且单例的名字请写成
  
      `+ (<#ClassName#> *)sharedManager;`
  
  4. 单例的实现请粘贴下面代码到工程中
       
       ```
       + (<#ClassName#> *)sharedManager
        {
           static <#ClassName#> *sharedAccountManagerInstance = nil;
            static dispatch_once_t predicate;
           dispatch_once(&predicate, ^{
           sharedAccountManagerInstance = [[self alloc] init];
           });
            return sharedAccountManagerInstance;
        }
        ```
        

## 正式使用

1. __导入自己创建的model的名字__
2. __向model中添加数据,可添加多条或者一条,代码如下__
   ```
   [MyUserData setHYCModelDict:@{
                                  @"userName":@"HYC",
                                  @"ages":@18,
                                  @"work":@"iOS",
                                  //@"isHaveGirlFriend":@NO
                                  }];
   ```
   
3. __删除所有数据__

   `[MyUserData removeHYCModelAllObject];`
   
4. __读取数据__

   `[MyUserData sharedManager].userName`
   
# 如有不明,请下载上面的demo,或加qq:[286716320]
