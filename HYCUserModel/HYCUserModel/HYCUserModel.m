//
//  HYCUserModel.m
//  HYCLazyLoading
//
//  Created by hyc on 2018/1/23.
//  Copyright © 2018年 hyc. All rights reserved.
//
#define userInformation [NSString stringWithFormat:@"%@_HYC_HYCUserModel",[[NSBundle mainBundle] bundleIdentifier]]
#import "HYCUserModel.h"
#import <objc/runtime.h>
@interface HYCUserModel(){
    NSMutableDictionary *_ClassNameOrNameDict;
    NSMutableDictionary *_dataMutDict;
}
@end
@implementation HYCUserModel
+ (HYCUserModel *)sharedManager
{
    static HYCUserModel *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}
-(instancetype)init {
    if (self = [super init]) {
        NSDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults]objectForKey:userInformation]];
        _dataMutDict = [NSMutableDictionary dictionaryWithCapacity:0];
        _ClassNameOrNameDict = [self ClassNameOrNameDict];
        for (NSString *keyName in _ClassNameOrNameDict) {
            if (![NSStringFromClass([self class]) isEqualToString:@"HYCUserModel"]) [self setValue:dict[keyName]?:
                                                                                     [_ClassNameOrNameDict[keyName] isEqualToString:@""] ? @0 : 
                                                                                     @"" forKey:keyName];
            _dataMutDict[keyName] = dict[keyName]?:
                                    [_ClassNameOrNameDict[keyName] isEqualToString:@""] ? @0 : 
                                    @"";
        }
        [[NSUserDefaults standardUserDefaults] setObject:_dataMutDict forKey:userInformation];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return self;
}
-(NSString *)getSubclass
{
    int numClasses;
    Class *classes = NULL;
    numClasses = objc_getClassList(NULL,0);
    if (numClasses >0 )
    {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) if (class_getSuperclass(classes[i]) == [HYCUserModel class]) return NSStringFromClass(classes[i]);
        free(classes);
    }
    return nil;
}
+ (void)setHYCModelDict:(NSDictionary *)data{
    [[HYCUserModel sharedManager] setHYCModelDict:data];
}
- (void)setHYCModelDict:(NSDictionary *)data{
    NSLog(@"%@",NSStringFromClass([self class]));
    if (data == nil) return;
    for (NSString *keyName in data) {
        [[NSClassFromString([self getSubclass]) sharedManager] setValue:data[keyName] forKey:keyName];
        _dataMutDict[keyName] = data[keyName];
    }
    [[NSUserDefaults standardUserDefaults] setObject:_dataMutDict forKey:userInformation];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)removeHYCModelAllObject{
    [[HYCUserModel sharedManager] removeHYCModelAllObject];
}
- (void)removeHYCModelAllObject{
    _ClassNameOrNameDict = [self ClassNameOrNameDict];
    NSLog(@"%@",[self getSubclass]);
    for (NSString *keyName in _ClassNameOrNameDict) {
        [[NSClassFromString([self getSubclass]) sharedManager] setValue:[_ClassNameOrNameDict[keyName] isEqualToString:@""] ? @0 : @"" forKey:keyName];
        _dataMutDict[keyName] = [_ClassNameOrNameDict[keyName] isEqualToString:@""] ? @0 : @"";
    }
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:userInformation];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSMutableDictionary *)ClassNameOrNameDict{
    u_int count;
    NSString * proClass = [NSStringFromClass([self class]) isEqualToString:@"HYCUserModel"]?[self getSubclass]:NSStringFromClass([self class]);
    objc_property_t *properties  =class_copyPropertyList([NSClassFromString(proClass) class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
        [attributesArray addObject:[NSString stringWithFormat:@"attributes:%s",property_getAttributes(properties[i])]];
    }
    NSMutableDictionary *ClassNameOrNameDict = [NSMutableDictionary dictionaryWithCapacity:0];
    [attributesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *objArray = [obj componentsSeparatedByString:@"_"];
        NSArray *objClassArray = [[objArray firstObject] componentsSeparatedByString:@","];
        NSArray *EVEobjClassArray = [[objClassArray firstObject] componentsSeparatedByString:[NSString stringWithFormat:@"%c",'"']];
        NSString *ObjName = [objArray lastObject]; //变量名字
        NSString *objClass = EVEobjClassArray.count>2 ? EVEobjClassArray[1] : @"";  //变量类名
        ClassNameOrNameDict[ObjName] = objClass;
    }];
    return ClassNameOrNameDict;
}
@end
