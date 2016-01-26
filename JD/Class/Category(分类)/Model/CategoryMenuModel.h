//
//  CategoryMenuModel.h
//  JD
//
//  Created by phone on 16/1/26.
//  Copyright © 2016年 lgwcn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryMenuModel : NSObject
@property (nonatomic,assign)int Id;
@property (copy,nonatomic)NSString *menuName;
@property (nonatomic,copy)NSString *urlName;

@property (nonatomic,strong)NSArray *nextArray;
@property (nonatomic,assign)NSInteger menuNumber;
@property (nonatomic,assign)float offsetScrorller;

- (CategoryMenuModel *)initWithDictionary:(NSDictionary *)dict;

+(CategoryMenuModel *)statusWithDictionary:(NSDictionary *)dict;

@end
