//
//  JDNavgationController.m
//  JDDemo
//
//  Created by Lizard77 on 16/1/20.
//  Copyright © 2016年 lgw. All rights reserved.
//

#import "JDNavgationController.h"
//#import "Header.h"
//#import "UIImage+Extension.h"
@interface JDNavgationController ()

@end

@implementation JDNavgationController

+(void)initialize{

    [self setupNavgationBarItem];
    [self setupBarButtonItemTheme];
    
    // Do any additional setup after loading the view.
}
+ (void)setupNavgationBarItem{
    UINavigationBar *apperance = [UINavigationBar appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = JDNavigationFont;
    if (!iOS7) {
        [apperance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    [apperance setTitleTextAttributes:textAttrs];
    
    
    
    
}
+(void)setupBarButtonItemTheme{
    UIBarButtonItem *apperance = [UIBarButtonItem appearance];
    [apperance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:JDCommonColor,NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
        [apperance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateDisabled];
    
    [apperance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"back_bt_7"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,30,0,0)];
    [apperance setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal  barMetrics:UIBarMetricsDefault];
    [apperance setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMax, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
     }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}
- (void)back{
    [self popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
