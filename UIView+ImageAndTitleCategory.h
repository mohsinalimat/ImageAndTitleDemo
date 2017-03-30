//
//  UIView+ImageAndTitleCategory.h
//  PJ
//
//  Created by WeiHu on 2017/3/16.
//  Copyright © 2017年 dj0708. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, PJBImageLocation) {
    PJBImageLocationCenterUp = 0,           //图片上居中 默认文字在下
    PJBImageLocationCenterLeft,             //图片左居中 默认文字在右
    PJBImageLocationCenterDown,             //图片下居住 默认文字在上
    PJBImageLocationCenterRight,            //图片右居中 默认文字在左
    PJBImageLocationCenter,                 //图片居中 默认文字在下
};

typedef void(^ImageAndTitleTapBlcok)();
@interface UIView (ImageAndTitleCategory)
@property(nullable, nonatomic, copy) ImageAndTitleTapBlcok pjTapBlock;
@property(nullable, nonatomic, strong, readonly) UIImageView *pjImageView;
@property(nullable, nonatomic, strong, readonly) UILabel *pjTitleLabel;
@property(nullable, nonatomic, strong, readonly) NSLayoutConstraint *imageLayoutConstraint;
@property(nullable, nonatomic, strong, readonly) NSLayoutConstraint *labelLayoutConstraint;

- (void)setImage:(UIImage * _Nonnull)image
       titleText:(NSString * _Nonnull)titleText
         spacing:(CGFloat)spacing;

- (void)setImage:(UIImage * _Nonnull)image
  attributedText:(NSAttributedString * _Nonnull)attributedText
         spacing:(CGFloat)spacing;

- (void)setImageLocation:(PJBImageLocation)location
                interval:(CGFloat)interval
                   image:(UIImage * _Nonnull)image
          attributedText:(NSAttributedString * _Nonnull)attributedText
                 spacing:(CGFloat)spacing;

- (void)setImageLocation:(PJBImageLocation)location
                interval:(CGFloat)interval
                   image:( UIImage * _Nonnull)image
               fixedSize:(CGSize)fixedSize
          attributedText:(NSAttributedString * _Nonnull)attributedText
                 spacing:(CGFloat)spacing;

@end
