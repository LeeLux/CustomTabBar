//
//  LTabBar.m
//  LaziestTabBar
//
//  Created by Laziest on 2017/10/24.
//  Copyright © 2017年 Laziest.Lee. All rights reserved.
//

#import "LTabBar.h"
#import <Masonry.h>

#define Tag 1000


@interface LTabBar ()

@property (nonatomic, strong) LTabBarItem *currentItem;


@end


@implementation LTabBar



#pragma mark - Action
- (void)itemClick:(UIGestureRecognizer *)recogn{
    LTabBarItem *item = (LTabBarItem *)recogn.view;
    if (self.currentItem) {
        if (self.currentItem.tag == item.tag) {
            return;
        }else{
            self.currentItem.selected = NO;
            item.selected = YES;
        }
    }else{
        item.selected = YES;
    }
    self.currentItem = item;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ltabBar:didSelectItem:)]) {
        [self.delegate ltabBar:self didSelectItem:self.currentItem];
    }
}

#pragma mark - Private

- (void)setItems:(NSArray<LTabBarItem *> *)items{
    self.clipsToBounds = NO;
    _items = [items copy];
    
    LTabBarItem *tempItem = nil;
    for (NSInteger i = 0; i < _items.count; i++) {
        LTabBarItem *item = _items[i];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClick:)];
        [item addGestureRecognizer:tap];
        [self addSubview:item];
        item.tag = i+Tag;
        if (tempItem) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(tempItem.mas_right);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                make.width.equalTo(tempItem.mas_width);
            }];
        }else{
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
            }];
        }
        if (self.currentIndex > 0) {
            item.selected = self.currentIndex == i ? YES:NO;
            if (self.currentIndex == i) self.currentItem = item;
            
        }else{
            if (i == 0) {
                item.selected = YES;
                self.currentItem = item;
            }else{
                item.selected = NO;
            }
        }
        tempItem = item;
    }
    [tempItem mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
    }];
}


@end
