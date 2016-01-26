//
//  CategoryViewController.m
//  JDDemo
//
//  Created by Lizard77 on 16/1/20.
//  Copyright © 2016年 lgw. All rights reserved.
//

#import "CategoryViewController.h"
#import "SearchBarView.h"
#import "CategoryMenuModel.h"
#import "MultilevelMenu.h"

@interface CategoryViewController ()<SearchBarViewDelegate>
@property (nonatomic,strong)NSMutableArray *list;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavgationItem];
    [self initData];
    // Do any additional setup after loading the view.
}
- (void)setupNavgationItem{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithBackgroudImageName:@"ico_camera_7_gray" highBackgroudImageName:nil target:self action:@selector(cameraClick)];
    SearchBarView *search = [[SearchBarView alloc] initWithFrame:CGRectMake(0, 7, mainWidth-60, 30)];
    search.delegate = self;
    self.navigationItem.titleView = search;
    

}
- (void)initData{
    _list = [NSMutableArray arrayWithCapacity:0];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Category" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    for (int i=0; i<array.count; i++) {
        CategoryMenuModel *menu = [[CategoryMenuModel alloc] init];
        menu.menuName = [array objectAtIndex:i][@"menuName"];
        menu.nextArray = [array objectAtIndex:i][@"topMenu"];
        NSMutableArray *sub = [NSMutableArray arrayWithCapacity:0];
        for (int j=0; j<menu.nextArray.count; j++) {
            CategoryMenuModel *menu1 = [[CategoryMenuModel alloc] init];
            menu1.menuName = [menu.nextArray objectAtIndex:j][@"topName"];
            menu1.nextArray = [menu.nextArray objectAtIndex:j][@"typeMenu"];
            NSMutableArray *zlist = [NSMutableArray arrayWithCapacity:0];
            for (int k=0; k<menu1.nextArray.count; k++) {
                CategoryMenuModel *menu2 = [[CategoryMenuModel alloc] init];
                menu2.menuName = [menu1.nextArray objectAtIndex:k][@"typeName"];
                menu2.urlName = [menu1.nextArray objectAtIndex:k][@"typeImg"];
                [zlist addObject:menu2];
            }menu1.nextArray = zlist;
            [sub addObject:menu1];
        }
        menu.nextArray = sub;
        [_list addObject:menu];
        
    }
    
    
}
- (void)initCategoryMenu{
    MultilevelMenu *view = [[MultilevelMenu alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainheight-49) WithData:_list withSelectIndex:^(NSInteger left,NSInteger right,CategoryMenuModel *info){
    }];
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
