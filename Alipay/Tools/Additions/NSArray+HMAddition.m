//
//
//  工具类
//
//  Created by 周林林 on 16/9/13.
//  Copyright © 2016年 传智播客. All rights reserved.
//

#import "NSArray+HMAddition.h"
#import "NSObject+HMAddition.h"

@implementation NSArray (HMAddition)

+ (NSArray *)hm_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName {
    
    //获取plist的url
    NSURL *url = [[NSBundle mainBundle] URLForResource:plistName withExtension:nil];
    
    //加载plist文件
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    
    //保存模型的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //获取模型对象类
    Class cls = NSClassFromString(clsName);

    //字典转模型对象
    for (NSDictionary *dict in list) {
        
        [arrayM addObject:[cls hm_objectWithDict:dict]];
    }
    
    return arrayM;
}

@end
