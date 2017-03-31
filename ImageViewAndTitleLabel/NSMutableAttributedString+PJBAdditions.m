//
//  NSAttributedString+PJBAdditions.m
//  PJ
//
//  Created by WeiHu on 2017/3/16.
//  Copyright © 2017年 dj0708. All rights reserved.
//

#import "NSMutableAttributedString+PJBAdditions.h"
#import <objc/runtime.h>
//#import "NSAttributedString+CalculateWidthAndHeight.h"
@implementation AttributedLayoutModel

- (instancetype)initText:(NSString *)text
                textFont:(UIFont *)textFont
               textColor:(UIColor *)textColor{

  return  [self initText:text
                textFont:textFont
               textColor:textColor
             textSpacing:0
           textAlignment:NSTextAlignmentLeft];
}

- (instancetype)initText:(NSString *)text
                textFont:(UIFont *)textFont
               textColor:(UIColor *)textColor
             textSpacing:(CGFloat)textSpacing
          textAlignment :(CGFloat)textAlignment{
    self = [super init];
    if (self) {
        _text = text;
        _textFont = textFont;
        _textColor = textColor;
        _textSpacing = textSpacing;
        _textAlignment = textAlignment;
    }
    return self;
}
@end

@implementation NSMutableAttributedString (PJBAdditions)

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initDirection:(AttributeDirection)direction{
    self = [super init];
    if (self) {
        
    }
    return self;
}



/////***************************//////
- (void)setAttributedStringSpacing:(CGFloat)spacing
{
     NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];//调整行间距
    [self addAttribute:NSParagraphStyleAttributeName
                 value:paragraphStyle
                 range:NSMakeRange(0, self.length)];
}
- (void)setMainTitleString:(NSString *)mainTitleString
             mainTitleFont:(UIFont *)mainTitleFont
            mainTitleColor:(UIColor *)mainTitleColor{
    [self setDirection:AttributeDirectionHorizontal mainTitleString:mainTitleString mainTitleFont:mainTitleFont mainTitleColor:mainTitleColor subTitleString:@"" subTitleFont:nil subTitleColor:nil spacing:0 alignment:NSTextAlignmentLeft];
    
}
- (void)setMainTitleString:(NSString *)mainTitleString
             mainTitleFont:(UIFont *)mainTitleFont
            mainTitleColor:(UIColor *)mainTitleColor
                 alignment:(NSTextAlignment)alignment{
    [self setDirection:AttributeDirectionHorizontal mainTitleString:mainTitleString mainTitleFont:mainTitleFont mainTitleColor:mainTitleColor subTitleString:@"" subTitleFont:nil subTitleColor:nil spacing:0 alignment:alignment];

}
- (void)setHorizontalDirectionAndMainTitleString:(NSString *)mainTitleString
                                   mainTitleFont:(UIFont *)mainTitleFont
                                  mainTitleColor:(UIColor *)mainTitleColor
                                  subTitleString:(NSString *)subTitleString
                                    subTitleFont:(UIFont *)subTitleFont
                                   subTitleColor:(UIColor *)subTitleColor{
     [self setDirection:AttributeDirectionHorizontal mainTitleString:mainTitleString mainTitleFont:mainTitleFont mainTitleColor:mainTitleColor subTitleString:subTitleString subTitleFont:subTitleFont subTitleColor:subTitleColor spacing:0 alignment:NSTextAlignmentLeft];
}

-  (void)setDirection:(AttributeDirection)direction
      mainTitleString:(NSString *)mainTitleString
        mainTitleFont:(UIFont *)mainTitleFont
       mainTitleColor:(UIColor *)mainTitleColor
       subTitleString:(NSString *)subTitleString
         subTitleFont:(UIFont *)subTitleFont
        subTitleColor:(UIColor *)subTitleColor
{
    
    [self setDirection:direction mainTitleString:mainTitleString mainTitleFont:mainTitleFont mainTitleColor:mainTitleColor subTitleString:subTitleString subTitleFont:subTitleFont subTitleColor:subTitleColor spacing:0 alignment:NSTextAlignmentLeft];
}
-  (void)setDirection:(AttributeDirection)direction
      mainTitleString:(NSString *)mainTitleString
        mainTitleFont:(UIFont *)mainTitleFont
       mainTitleColor:(UIColor *)mainTitleColor
       subTitleString:(NSString *)subTitleString
         subTitleFont:(UIFont *)subTitleFont
        subTitleColor:(UIColor *)subTitleColor
            alignment:(NSTextAlignment)alignment
{
    
    [self setDirection:direction mainTitleString:mainTitleString mainTitleFont:mainTitleFont mainTitleColor:mainTitleColor subTitleString:subTitleString subTitleFont:subTitleFont subTitleColor:subTitleColor spacing:0 alignment:alignment];
}
-  (void)setDirection:(AttributeDirection)direction
      mainTitleString:(NSString *)mainTitleString
        mainTitleFont:(UIFont *)mainTitleFont
       mainTitleColor:(UIColor *)mainTitleColor
       subTitleString:(NSString *)subTitleString
         subTitleFont:(UIFont *)subTitleFont
        subTitleColor:(UIColor *)subTitleColor
              spacing:(CGFloat)spacing
{
 
    [self setDirection:direction mainTitleString:mainTitleString mainTitleFont:mainTitleFont mainTitleColor:mainTitleColor subTitleString:subTitleString subTitleFont:subTitleFont subTitleColor:subTitleColor spacing:spacing alignment:NSTextAlignmentLeft];
}
-  (void)setDirection:(AttributeDirection)direction
      mainTitleString:(NSString *)mainTitleString
        mainTitleFont:(UIFont *)mainTitleFont
       mainTitleColor:(UIColor *)mainTitleColor
       subTitleString:(NSString *)subTitleString
         subTitleFont:(UIFont *)subTitleFont
        subTitleColor:(UIColor *)subTitleColor
              spacing:(CGFloat)spacing
            alignment:(NSTextAlignment)alignment
{
    if (mainTitleString && mainTitleString.length > 0) {
        [self appendAttributedString:[[NSAttributedString alloc] initWithString:mainTitleString]];
        
        if (subTitleString && subTitleString.length > 0 && direction == AttributeDirectionVertical) {
            [self appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        }
      
        
        [self addAttribute:NSFontAttributeName
                     value:mainTitleFont
                     range:NSMakeRange(0, mainTitleString.length)];
        [self addAttribute:NSForegroundColorAttributeName
                     value:mainTitleColor
                     range:NSMakeRange(0, mainTitleString.length)];
    }
    
    if (subTitleString && subTitleString.length > 0) {
        [self appendAttributedString:[[NSAttributedString alloc] initWithString:subTitleString]];
        NSInteger location = ((direction == AttributeDirectionVertical) ? mainTitleString.length + 1 : mainTitleString.length);
        [self addAttribute:NSFontAttributeName
                     value:subTitleFont
                     range:NSMakeRange(location, subTitleString.length)];
        [self addAttribute:NSForegroundColorAttributeName
                     value:subTitleColor
                     range:NSMakeRange(location, subTitleString.length)];
    }
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];//调整行间距
    paragraphStyle.alignment = alignment;
    
    [self addAttribute:NSParagraphStyleAttributeName
                 value:paragraphStyle
                 range:NSMakeRange(0, self.length)];

}
- (void)setDirection:(AttributeDirection)direction layoutModelArray:(NSArray<AttributedLayoutModel *> *)layoutModelArray{
    //单个段落样式
    for (AttributedLayoutModel *layoutModel in layoutModelArray) {
        if (layoutModel && layoutModel.text.length > 0) {
            
            NSRange range = NSMakeRange(self.length, layoutModel.text.length);
            [self appendAttributedString:[[NSAttributedString alloc] initWithString:layoutModel.text]];
            if (direction == AttributeDirectionVertical) {
                [self appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
            }
            
            [self addAttribute:NSFontAttributeName
                         value:layoutModel.textFont
                         range:range];
            [self addAttribute:NSForegroundColorAttributeName
                         value:layoutModel.textColor
                         range:range];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:layoutModel.textSpacing];//调整行间距
            paragraphStyle.alignment = layoutModel.textAlignment;
            
            [self addAttribute:NSParagraphStyleAttributeName
                         value:paragraphStyle
                         range:range];
        }
    }
   
    
}
- (void)setDirection:(AttributeDirection)direction layoutModelArray:(NSArray<AttributedLayoutModel *> *)layoutModelArray spacing:(CGFloat)spacing alignment:(NSTextAlignment)alignment{
    
    for (AttributedLayoutModel *layoutModel in layoutModelArray) {
        if (layoutModel && layoutModel.text.length > 0) {
            
            NSRange range = NSMakeRange(self.length, layoutModel.text.length);
            [self appendAttributedString:[[NSAttributedString alloc] initWithString:layoutModel.text]];
            if (direction == AttributeDirectionVertical) {
                [self appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
            }
            
            [self addAttribute:NSFontAttributeName
                         value:layoutModel.textFont
                         range:range];
            [self addAttribute:NSForegroundColorAttributeName
                         value:layoutModel.textColor
                         range:range];
            
        }
    }
    //整体改变段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];//调整行间距
    paragraphStyle.alignment = alignment;
    
    [self addAttribute:NSParagraphStyleAttributeName
                 value:paragraphStyle
                 range:NSMakeRange(0, self.length)];
    
}
- (void)appendAttributedLayoutModel:(AttributedLayoutModel *)layoutModel{
    
}

@end
