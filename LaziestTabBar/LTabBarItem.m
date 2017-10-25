//
//  LTabBarItem.m
//  LaziestTabBar
//
//  Created by Laziest on 2017/10/24.
//  Copyright © 2017年 Laziest.Lee. All rights reserved.
//

#import "LTabBarItem.h"
#import <Masonry.h>

@interface LTabBarItem ()

@property (nonatomic, strong) UIImageView *normalImageView;
@property (nonatomic, strong) UIImageView *selectedImageView;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation LTabBarItem

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    
    self = [super init];
    if (self) {
        self.normalColorTitleColor = [UIColor whiteColor];
        self.selectedTitleColor    = [UIColor redColor];
        [self configViewsWithTitle:title image:image selectedImage:selectedImage];
    }
    return self;
}

- (void)dealloc{
}

#pragma mark - Private

- (void)setSelected:(BOOL)selected{
    _selected = selected;
    typeof(self) __weak weakself = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakself.normalImageView.hidden = _selected;
        weakself.selectedImageView.hidden = !_selected;
        weakself.titleLabel.textColor = _selected?weakself.selectedTitleColor:weakself.normalColorTitleColor;
    }];
}

- (void)configViewsWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    self.normalImageView = [UIImageView new];
    self.normalImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.normalImageView.userInteractionEnabled = YES;
    [self addSubview:self.normalImageView];
    [self.normalImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.normalImageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];

    
    self.selectedImageView = [UIImageView new];
    self.selectedImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.selectedImageView.userInteractionEnabled = YES;
    [self addSubview:self.selectedImageView];
    [self.selectedImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.selectedImageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];


    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:12.];
    [self addSubview:self.titleLabel];
    [self.titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    self.normalImageView.image = image;
    self.selectedImageView.image = selectedImage;
    self.titleLabel.text = title;
    
    [self configLayout];
}

- (void)changeRotate:(NSNotification*)noti {
    [self configLayout];
}

- (void)configLayout{
    
    [self configVerLayout];
    
}

- (void)configVerLayout{
    [self.selectedImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-5);
    }];
    
    [self.normalImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(23, 23));
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.normalImageView.mas_bottom).offset(5);
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-2);
    }];
}

- (void)configHorLayout{
    [self.selectedImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_top).offset(5);
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.normalImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(23, 23));
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.normalImageView.mas_centerY);
        make.left.equalTo(self.normalImageView.mas_right).offset(10);
        make.right.lessThanOrEqualTo(self.mas_right).offset(-5);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
