//
//  LTabBar.h
//  LaziestTabBar
//
//  Created by Laziest on 2017/10/24.
//  Copyright © 2017年 Laziest.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTabBarItem.h"


@class LTabBar;
@protocol LTabBarDelegate <NSObject>

@optional
- (void)ltabBar:(LTabBar *)tabBar didSelectItem:(LTabBarItem *)item;

@end
@interface LTabBar : UIView

@property (nonatomic,   copy) UIImage *backgroundImage;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic,   copy) NSArray<LTabBarItem *> *items;
@property (nonatomic,   weak) id<LTabBarDelegate> delegate;

@end
