//
//  HomeViewController.m
//  JDDemo
//
//  Created by Lizard77 on 16/1/20.
//  Copyright © 2016年 lgw. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchBarView.h"
#import "SDCycleScrollView.h"
#import "SDRefresh.h"
#import "MJRefresh.h"
//#import "Header.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,SearchBarViewDelegate,SDCycleScrollViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)SDCycleScrollView *scroll;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTableView];
    [self setNavgationItem];
    [self setupRefresh];
    // Do any additional setup after loading the view.
}
- (void)loadTableView{
   // self.edgesForExtendedLayout = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainheight-44) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = self.scroll;
    
    
}
- (void)setNavgationItem{
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem BarButtonItemWithImageName:@"ico_camera_7" highImageName:nil title:@"扫啊扫" target:self action:@selector(camerca)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithImageName:@"HomePage_Message" highImageName:nil title:@"消息中心" target:self  action:@selector(message)];
    SearchBarView *search = [[SearchBarView alloc] initWithFrame:CGRectMake(0, 7, 240, 30)];
    search.delegate = self;
    self.navigationItem.titleView = search;
    
}
- (UIView *)scroll{

    NSArray *image = @[
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1402/221/421883372/88115/8cc2231a/55815835N35a44559.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t976/208/1221678737/91179/5d7143d5/5588e849Na2c20c1a.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t805/241/1199341035/289354/8648fe55/5581211eN7a2ebb8a.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1606/199/444346922/48930/355f9ef/55841cd0N92d9fa7c.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1609/58/409100493/49144/7055bec5/557e76bfNc065aeaf.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t895/234/1192509025/111466/512174ab/557fed56N3e023b70.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t835/313/1196724882/359493/b53c7b70/5581392cNa08ff0a9.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t898/15/1262262696/95281/57d1f12f/558baeb4Nbfd44d3a.jpg"
                                  ];
    _scroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, mainWidth, 180) imageURLStringsGroup:image];
    _scroll.infiniteLoop = YES;
    _scroll.delegate = self;
    _scroll.placeholderImage = [UIImage imageNamed:@"homepagebannerplaceholder"];
    _scroll.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _scroll.autoScrollTimeInterval = 2.0;
    //_scroll.imageURLStringsGroup = image;

    return _scroll;
    
}
#pragma mark  加载下拉刷新
- (void)setupRefresh{
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    //LegendHeaderWithRefreshingBlock:^(){
//        [self.tableView reloadData];
//        [self.tableView.header endRefreshing];}];
                         //GifHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    
    

}
- (void)loadNewDate{
    [self.tableView reloadData];
    [self.tableView.header endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *identy = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identy];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行!",indexPath.row];
    
    return cell;
    
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"您点击了第%ld个cell!",indexPath.row);
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
#pragma mark 导航栏
- (void)camerca{
    DLog(@"拍照吗？");
}
- (void)message{
    DLog(@"亲，您有新短消息");
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
