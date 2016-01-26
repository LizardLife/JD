//
//  CategoryMenuModel.m
//  JD
//
//  Created by phone on 16/1/26.
//  Copyright © 2016年 lgwcn. All rights reserved.
//

#import "CategoryMenuModel.h"

@implementation CategoryMenuModel

- (CategoryMenuModel *)initWithDictionary:(NSDictionary *)dict{
    if (self == [self init]) {
        self.Id = [dict[@"Id"] intValue];
        self.menuName = dict[@"menuName"];
        
    }
    return self;
}

+(CategoryMenuModel *)statusWithDictionary:(NSDictionary *)dict{
    CategoryMenuModel *categoryMenu = [[CategoryMenuModel alloc] initWithDictionary:dict];
    return categoryMenu;
}
@end
