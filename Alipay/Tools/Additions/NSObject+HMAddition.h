//
//
//  工具类
//
//  Created by 周林林 on 16/9/13.
//  Copyright © 2016年 传智播客. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HMAddition)

/// 使用字典创建模型对象
///
/// @param dict 字典
///
/// @return 模型对象
+ (instancetype)hm_objectWithDict:(NSDictionary *)dict;

@end
