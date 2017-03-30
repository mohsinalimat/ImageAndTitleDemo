
//
//  UIView+ImageAndTitleCategory.m
//  PJ
//
//  Created by WeiHu on 2017/3/16.
//  Copyright © 2017年 dj0708. All rights reserved.
//

#import "UIView+ImageAndTitleCategory.h"
#import <objc/runtime.h>

@implementation UIView (ImageAndTitleCategory)

- (void)setImage:(UIImage * _Nonnull)image
       titleText:(NSString * _Nonnull)titleText
         spacing:(CGFloat)spacing{
    [self setImage:image
    attributedText:[[NSAttributedString alloc] initWithString:titleText]
           spacing:spacing];
}

- (void)setImage:(UIImage * _Nonnull)image
  attributedText:(NSAttributedString * _Nonnull)attributedText
         spacing:(CGFloat)spacing{
    [self setImageLocation:PJBImageLocationCenterLeft
                  interval:0
                     image:image
                 fixedSize:image.size
            attributedText:attributedText
                   spacing:spacing];
}

- (void)setImageLocation:(PJBImageLocation)location
                 interval:(CGFloat)interval
                    image:(UIImage * _Nonnull)image
           attributedText:(NSAttributedString * _Nonnull)attributedText
                  spacing:(CGFloat)spacing{
    [self setImageLocation:location
                  interval:interval
                     image:image
                 fixedSize:image.size
            attributedText:attributedText
                   spacing:spacing];
}

- (void)setImageLocation:(PJBImageLocation)location
                interval:(CGFloat)interval
                   image:(UIImage * _Nonnull)image
               fixedSize:(CGSize)fixedSize
          attributedText:(NSAttributedString * _Nonnull)attributedText
                 spacing:(CGFloat)spacing{
    if (!self.pjImageView) {
        self.pjImageView = [self private_getImaegView];
        [self addSubview:self.pjImageView];
        [self constraintsForImageViewLocation:location interval:interval fixedSize:fixedSize];
    }
    self.pjImageView.image = image;
    self.imageLayoutConstraint.constant = interval;
    
    if (!self.pjTitleLabel) {
        self.pjTitleLabel = [self private_getTitleLabel];
        [self addSubview:self.pjTitleLabel];
        [self constraintsTitleLabelLocation:location spacing:spacing];
    }
    self.pjTitleLabel.attributedText = attributedText;
    self.labelLayoutConstraint.constant = spacing;

}

- (void)constraintsForImageViewLocation:(PJBImageLocation)location
                               interval:(CGFloat)interval
                              fixedSize:(CGSize)fixedSize{
    switch (location) {
        case PJBImageLocationCenterUp:
        {
            self.imageLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:interval];
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
            //Top
            [self addConstraint:self.imageLayoutConstraint];
        }
            break;
        case PJBImageLocationCenterLeft:
        {
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
            //Left
            self.imageLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:interval];
            [self addConstraint:self.imageLayoutConstraint];
        }
            break;
        case PJBImageLocationCenterDown:
        {
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
            //Down
            self.imageLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:interval];
            [self addConstraint:self.imageLayoutConstraint];
        }
            break;
        case PJBImageLocationCenterRight:
        {
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
            //Right
            self.imageLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:interval];
            [self addConstraint:self.imageLayoutConstraint];
        }
            break;
        default:
            break;
    }
    //width
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:fixedSize.width]];
    //height
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:fixedSize.height]];
}

- (void)constraintsTitleLabelLocation:(PJBImageLocation)location
                              spacing:(CGFloat)spacing{
    
    // center subTitleLabel vertically in self
    switch (location) {
        case PJBImageLocationCenterUp:
        {
            //Top
            self.labelLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:spacing];
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
            //width
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
            [self addConstraint:self.labelLayoutConstraint];
        }
            break;
        case PJBImageLocationCenterLeft:
        {
            //Left
            self.labelLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:spacing];
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
            //Right
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
            [self addConstraint:self.labelLayoutConstraint];
            
            [self addConstraint:self.labelLayoutConstraint];
        }
            break;
        case PJBImageLocationCenterDown:
        {
            
            //Down
            self.labelLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:spacing];
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
            //width
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
            [self addConstraint:self.labelLayoutConstraint];
        }
            break;
        case PJBImageLocationCenterRight:
        {
            
            //Right
            self.labelLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:spacing];
            //Center
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.pjImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
            //Left
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pjTitleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
            [self addConstraint:self.labelLayoutConstraint];
        }
            break;
        default:
            break;
    }
}
//private
- (void)pjTapClickGestureAction:(UITapGestureRecognizer *)tapGesture{
    if (self.pjTapBlock) {
        self.pjTapBlock();
    }
}
- (ImageAndTitleTapBlcok)pjTapBlock
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setPjTapBlock:(ImageAndTitleTapBlcok)pjTapBlock
{
    objc_setAssociatedObject(self, @selector(pjTapBlock), pjTapBlock, OBJC_ASSOCIATION_COPY);
    if (pjTapBlock) {
        UITapGestureRecognizer *tapClickGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pjTapClickGestureAction:)];
        [self addGestureRecognizer:tapClickGesture];
        self.userInteractionEnabled = YES;
    }
}
- (UIImageView *)pjImageView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPjImageView:(UIImageView *)pjImageView
{
    objc_setAssociatedObject(self, @selector(pjImageView), pjImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UILabel *)pjTitleLabel
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPjTitleLabel:(UILabel *)pjTitleLabel
{
    objc_setAssociatedObject(self, @selector(pjTitleLabel), pjTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSLayoutConstraint *)imageLayoutConstraint
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setImageLayoutConstraint:(NSLayoutConstraint * _Nullable)imageLayoutConstraint
{
    objc_setAssociatedObject(self, @selector(imageLayoutConstraint), imageLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSLayoutConstraint *)labelLayoutConstraint
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLabelLayoutConstraint:(NSLayoutConstraint * _Nullable)labelLayoutConstraint
{
    objc_setAssociatedObject(self, @selector(labelLayoutConstraint), labelLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView *)private_getImaegView{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.translatesAutoresizingMaskIntoConstraints = false;
    return imageView;
}
- (UILabel *)private_getTitleLabel{

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.numberOfLines = 0;
    titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    return titleLabel;
}
@end
