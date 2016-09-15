//
//
//  工具类
//
//  Created by 周林林 on 16/9/13.
//  Copyright © 2016年 传智播客. All rights reserved.
//

#import "UIColor+HMAddition.h"

@implementation UIColor (HMAddition)

+ (instancetype)hm_colorWithHex:(uint32_t)hex {
    
    uint8_t r = (hex & 0xff0000) >> 16;
    uint8_t g = (hex & 0x00ff00) >> 8;
    uint8_t b = hex & 0x0000ff;
    
    return [self hm_colorWithRed:r green:g blue:b];
}

/**
 *  返回随机颜色
 */
+ (instancetype)hm_randomColor {
    
    return [UIColor hm_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}

/**
 *  传入RGB的值返回颜色
 */
+ (instancetype)hm_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

@end
