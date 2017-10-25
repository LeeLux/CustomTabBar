//
//  LTabBarItem.h
//  LaziestTabBar
//
//  Created by Laziest on 2017/10/24.
//  Copyright © 2017年 Laziest.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LTabBarItemItem) {
    LTabBarItemNormalType,
    LTabBarItemBigType,
};

@interface LTabBarItem : UIView

@property (nonatomic, assign) BOOL    selected;
@property (nonatomic,   copy) UIColor *selectedTitleColor;
@property (nonatomic,   copy) UIColor *normalColorTitleColor;

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@end
