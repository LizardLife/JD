//
//  CommodityModel.m
//  JD
//
//  Created by phone on 16/1/26.
//  Copyright © 2016年 lgwcn. All rights reserved.
//

#import "CommodityModel.h"

@implementation CommodityModel

- (CommodityModel *)initWithDictionary:(NSDictionary *)dict{
    if (self = [self init]) {
        self.Id = [dict[@"Id"] longLongValue];
        self.commodityImageUrl = dict[@"commidityImageUrl"];
        self.commidityName = dict[@"commidityName"];
        self.commidityPrice = dict[@"commidityPrice"];
        self.commidityZX = dict[@"commidityZX"];
        self.commidityPraise = dict[@"commidityPraise"];
        
    }
    return self;
}
+ (CommodityModel *)commidityWithDictionary:(NSDictionary *)dict{
    CommodityModel *commodity = [[CommodityModel alloc] initWithDictionary:dict];
    return commodity;
}
- (NSString *)praise{
    return [NSString stringWithFormat:@"好评%@ %@人",_commidityPraise,_commidityPerson];
}
@end
