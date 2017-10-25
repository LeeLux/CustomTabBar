//
//  TabViewController.m
//  LaziestTabBar
//
//  Created by Laziest on 2017/10/24.
//  Copyright © 2017年 Laziest.Lee. All rights reserved.
//

#import "TabViewController.h"
#import "LTabBar.h"

@interface TabViewController () <LTabBarDelegate>

@property (nonatomic, strong) LTabBar *customTabBar;

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRotate:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];

    LTabBarItem *itemOne = [[LTabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_home_normal"] selectedImage:[UIImage imageNamed:@"tab_home_selected"]];
    LTabBarItem *itemTwo = [[LTabBarItem alloc] initWithTitle:@"邻居" image:[UIImage imageNamed:@"tab_card_normal"] selectedImage:[UIImage imageNamed:@"tab_card_selected"]];
    LTabBarItem *itemThree = [[LTabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"tab_account_normal"] selectedImage:[UIImage imageNamed:@"tab_account_selected"]];

    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor yellowColor];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    vc1.title = @"首页";
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor orangeColor];
    self.viewControllers = @[nav1,vc2,vc3];

    
    self.customTabBar = [[LTabBar alloc] initWithFrame:self.tabBar.bounds];
    self.customTabBar.backgroundColor = [UIColor blueColor];
    self.customTabBar.items = @[itemOne,itemTwo,itemThree];
    self.customTabBar.delegate = self;
    [self.tabBar addSubview:self.customTabBar];
    self.tabBar.barTintColor = [UIColor blueColor];
    self.tabBar.translucent= NO;

}

#pragma mark - LTabBarDelegate

- (void)ltabBar:(LTabBar *)tabBar didSelectItem:(LTabBarItem *)item{
    [self setSelectedIndex:item.tag- 1000];
}

- (void)changeRotate:(NSNotification*)noti {
    self.customTabBar.frame = self.tabBar.bounds;
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
