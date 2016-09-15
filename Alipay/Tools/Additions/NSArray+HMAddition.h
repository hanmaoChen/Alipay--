//
//
//  工具类
//
//  Created by 周林林 on 16/9/13.
//  Copyright © 2016年 传智播客. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSArray (HMAddition)

/// 从 plist 文件创建指定 clsName 对象数组
///
/// @param plistName plist 文件名
/// @param clsName   要创建模型的类名
///
/// @return clsName 的对象数组
+ (NSArray *)hm_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName;

@end
