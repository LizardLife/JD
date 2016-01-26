//
//  CommodityTableViewController.m
//  JD
//
//  Created by phone on 16/1/26.
//  Copyright © 2016年 lgwcn. All rights reserved.
//

#import "CommodityTableViewController.h"
#import "CommodityModel.h"
#import "SearchBarView.h"
@interface CommodityTableViewController ()
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *commodity;
@end

@implementation CommodityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setupNavgationItem];
    //[self initView];
    // Do any additional setup after loading the view.
}
- (void)initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Commodity" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _commodity = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_commodity addObject:[CommodityModel commidityWithDictionary:obj]];
    }];
    
}
- (void)setupNavgationItem{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem BarButtonItemWithBackgroudImageName:@"back_bt_7" highBackgroudImageName:nil target:self action:@selector(backClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithBackgroudImageName:@"changeProductListGrid" highBackgroudImageName:nil target:self action:@selector(changeClick)];
    SearchBarView *search = [[SearchBarView alloc] initWithFrame:CGRectMake(0, 7, 240, 30)];
    search.delegate = self;
    self.navigationItem.titleView = search;
    
    


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
