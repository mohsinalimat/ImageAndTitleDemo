//
//  NSAttributedString+PJBAdditions.h
//  PJ
//
//  Created by WeiHu on 2017/3/16.
//  Copyright © 2017年 dj0708. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AttributedLayoutModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) CGFloat textSpacing;
@property (nonatomic, assign) NSTextAlignment textAlignment;

- (instancetype)initText:(NSString *)text
                textFont:(UIFont *)textFont
               textColor:(UIColor *)textColor;

- (instancetype)initText:(NSString *)text
                textFont:(UIFont *)textFont
               textColor:(UIColor *)textColor
             textSpacing:(CGFloat)textSpacing
          textAlignment :(CGFloat)textAlignment;


@end

typedef NS_ENUM(NSInteger, AttributeDirection) {
    AttributeDirectionVertical,     //垂直方向
    AttributeDirectionHorizontal    //水平方向
};

@interface NSMutableAttributedString (PJBAdditions)


- (instancetype)initDirection:(AttributeDirection)direction;
//**************************单行或者两行**************************//
-  (void)setAttributedStringSpacing:(CGFloat)spacing;

- (void)setMainTitleString:(NSString *)mainTitleString
             mainTitleFont:(UIFont *)mainTitleFont
            mainTitleColor:(UIColor *)mainTitleColor;

- (void)setMainTitleString:(NSString *)mainTitleString
             mainTitleFont:(UIFont *)mainTitleFont
            mainTitleColor:(UIColor *)mainTitleColor
                 alignment:(NSTextAlignment)alignment;

- (void)setHorizontalDirectionAndMainTitleString:(NSString *)mainTitleString
                                   mainTitleFont:(UIFont *)mainTitleFont
                                  mainTitleColor:(UIColor *)mainTitleColor
                                  subTitleString:(NSString *)subTitleString
                                    subTitleFont:(UIFont *)subTitleFont
                                   subTitleColor:(UIColor *)subTitleColor;

- (void)setDirection:(AttributeDirection)direction
     mainTitleString:(NSString *)mainTitleString
       mainTitleFont:(UIFont *)mainTitleFont
      mainTitleColor:(UIColor *)mainTitleColor
      subTitleString:(NSString *)subTitleString
        subTitleFont:(UIFont *)subTitleFont
       subTitleColor:(UIColor *)subTitleColor;

- (void)setDirection:(AttributeDirection)direction
     mainTitleString:(NSString *)mainTitleString
       mainTitleFont:(UIFont *)mainTitleFont
      mainTitleColor:(UIColor *)mainTitleColor
      subTitleString:(NSString *)subTitleString
        subTitleFont:(UIFont *)subTitleFont
       subTitleColor:(UIColor *)subTitleColor
           alignment:(NSTextAlignment)alignment;

- (void)setDirection:(AttributeDirection)direction
     mainTitleString:(NSString *)mainTitleString
       mainTitleFont:(UIFont *)mainTitleFont
      mainTitleColor:(UIColor *)mainTitleColor
      subTitleString:(NSString *)subTitleString
        subTitleFont:(UIFont *)subTitleFont
       subTitleColor:(UIColor *)subTitleColor
             spacing:(CGFloat)spacing;

-  (void)setDirection:(AttributeDirection)direction
      mainTitleString:(NSString *)mainTitleString
        mainTitleFont:(UIFont *)mainTitleFont
       mainTitleColor:(UIColor *)mainTitleColor
       subTitleString:(NSString *)subTitleString
         subTitleFont:(UIFont *)subTitleFont
        subTitleColor:(UIColor *)subTitleColor
              spacing:(CGFloat)spacing
            alignment:(NSTextAlignment)alignment;
//**************************单行或者两行**************************//
//**************************三行以上的另作处理*********************//
- (void)setDirection:(AttributeDirection)direction
    layoutModelArray:(NSArray<AttributedLayoutModel *> *)layoutModelArray
             spacing:(CGFloat)spacing
           alignment:(NSTextAlignment)alignment;
- (void)setDirection:(AttributeDirection)direction
    layoutModelArray:(NSArray<AttributedLayoutModel *> *)layoutModelArray;
- (void)appendAttributedLayoutModel:(AttributedLayoutModel *)layoutModel;
@end
