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

## Usage
* 说起使用来啊,请大家注意几点
  > 1. 存储用户信息的模型只能创建一个
  > 2. 创建的模型需要继承HYCUserModel后使用
  > 3. 需要给给创建的模型实现单例方法并声明出来,并且单例的名字请写成`sharedManager`
       >单例的实现请粘贴下面代码到工程中
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

