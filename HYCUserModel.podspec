
Pod::Spec.new do |s|
s.name     = 'HYCUserModel'
s.version  = '1.0' 
 s.license = { :type => "MIT", :file => "LICENSE" }
s.summary  = '利用用户偏好设置存储用户重要信息,登陆信息等重要信息,使用方法简单,数据准确' 
s.homepage = 'https://github.com/hyc286716320/HYCUserModel'
s.author   = {'HuYunchao' => 'hyc286716320'} 
s.source   = { :git => 'https://github.com/hyc286716320/HYCUserModel.git', :tag =>s.version} 
s.platform     = :ios 
s.source_files = 'HYCUserModel/HYCUserModel/.{h,m}'
s.requires_arc = true

#s.dependency 'ReactiveCocoa','~> 2.5'
end
