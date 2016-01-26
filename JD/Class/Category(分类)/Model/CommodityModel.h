//
//  CommodityModel.h
//  JD
//
//  Created by phone on 16/1/26.
//  Copyright © 2016年 lgwcn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommodityModel : NSObject

@property (nonatomic,assign)long long Id;//商品ID
@property (nonatomic,copy)NSString *commodityImageUrl;//图像
@property (nonatomic,copy)NSString *commidityName;//名字
@property (nonatomic,copy)NSString *commidityPrice;//价钱
@property (nonatomic,copy)NSString *commidityZX;//手机专享
@property (nonatomic,copy)NSString *commidityPraise;//评价
@property (nonatomic,copy)NSString *commidityPerson;//评价人数

- (CommodityModel *)initWithDictionary:(NSDictionary *)dict;
+ (CommodityModel *)commidityWithDictionary:(NSDictionary *)dict;
- (NSString *)praise;
@end
