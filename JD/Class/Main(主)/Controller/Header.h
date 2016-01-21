//
//  Header.h
//  JDDemo
//
//  Created by Lizard77 on 16/1/20.
//  Copyright © 2016年 lgw. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define mainWidth [UIScreen mainScreen].bounds.size.width
#define mainheight [UIScreen mainScreen].bounds.size.height

#import "LolitaFunctions.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import "UIImage+Extension.h"
#import "NSString+Extension.h"
#import "UIButton+Extension.h"
#import "MBProgressHUD+MJ.h"
#import "MasonyUtil.h"
#import "Masonry.h"
#import "UserDefaultsUtils.h"

#define _LolitaFunctions [LolitaFunctions sharedObject]
//颜色
#define JDColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//导航栏标题字体大小
#define JDNavigationFont [UIFont boldSystemFontOfSize:16]
//公用颜色
#define JDCommonColor [UIColor colorWithRed:0.478 green:0.478 blue:0.478 alpha:1]

//是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//是否为iOS8及以上系统
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)


//日至输出
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


#endif /* Header_h */
