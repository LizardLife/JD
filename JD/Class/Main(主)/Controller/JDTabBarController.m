//
//  JDTabBarController.m
//  JDDemo
//
//  Created by Lizard77 on 16/1/20.
//  Copyright © 2016年 lgw. All rights reserved.
//

#import "JDTabBarController.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "FindViewController.h"
#import "MyViewController.h"
#import "CartViewController.h"
#import "JDNavgationController.h"

@interface JDTabBarController ()
@property (nonatomic,strong)HomeViewController *home;
@property (nonatomic,strong)CategoryViewController *cate;
@property (nonatomic,strong)FindViewController *find;
@property (nonatomic,strong)CartViewController *cart;
@property (nonatomic,strong)MyViewController *my;


@end

@implementation JDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAllChildVC];

    // Do any additional setup after loading the view.
}
- (void)addAllChildVC{
    _home = [[HomeViewController alloc] init];
    [self addOneChildVc:_home withTitle:@"首页" imagename:[UIImage imageNamed:@"tabBar_home_normal"] selectedImage:[UIImage imageNamed:@"tabBar_home_press"]];
    
    _cate = [[CategoryViewController alloc] init];
    [self addOneChildVc:_cate withTitle:@"分类" imagename:[UIImage imageNamed:@"tabBar_category_normal"] selectedImage:[UIImage imageNamed:@"tabBar_category_press"]];
    
    _find = [[FindViewController alloc] init];
    [self addOneChildVc:_find withTitle:@"发现" imagename:[UIImage imageNamed:@"tabBar_find_normal"] selectedImage:[UIImage imageNamed:@"tabBar_find_press"]];
    
    _cart = [[CartViewController alloc] init];
    [self addOneChildVc:_cart withTitle:@"购物车" imagename:[UIImage imageNamed:@"tabBar_cart_normal"] selectedImage:[UIImage imageNamed:@"tabBar_cart_press"]];
    
    _my = [[MyViewController alloc] init];
    [self addOneChildVc:_my withTitle:@"我的" imagename:[UIImage imageNamed:@"tabBar_myJD_normal"] selectedImage:[UIImage imageNamed:@"tabBar_myJD_press"]];
    
    
    
}
- (void)addOneChildVc:(UIViewController *)childVc withTitle:(NSString *)title imagename:(UIImage *)image selectedImage:(UIImage *)selsectedImage{
    childVc.title = title;
    childVc.tabBarItem.image = image;
    childVc.tabBarItem.selectedImage = selsectedImage;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBar_bg"];
    JDNavgationController *nav = [[JDNavgationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
