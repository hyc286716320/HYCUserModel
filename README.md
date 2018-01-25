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
### ImageObject处数组里面的元素为一组手图,一次可添加多张,每一个字典为一张手图,数组内用逗号隔开
