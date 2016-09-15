//
//
//  工具类
//
//  Created by 周林林 on 16/9/13.
//  Copyright © 2016年 传智播客. All rights reserved.
//

#import "UILabel+HMAddition.h"

@implementation UILabel (HMAddition)

+ (instancetype)hm_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    
    return label;
}

@end
