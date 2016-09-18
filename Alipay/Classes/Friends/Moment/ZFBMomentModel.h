//
//  ZFBMomentModel.h
//  ZFB生活圈
//
//  Created by  chenhanmao on 9/9/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBMomentModel : NSObject

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *picture;
@property(nonatomic,copy)NSString *time;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)momentWithDict:(NSDictionary *)dict;
@end
