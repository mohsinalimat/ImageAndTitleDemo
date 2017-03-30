//
//  UILabel+PJBAdditons.m
//  PJ
//
//  Created by WeiHu on 2017/3/16.
//  Copyright © 2017年 dj0708. All rights reserved.
//

#import "UILabel+PJBAdditons.h"
#import <objc/runtime.h>

@interface UILabel (private)
@property (nonatomic, strong) NSTextContainer *textContainer;
@property (nonatomic, strong) NSLayoutManager *layoutManager;
@end

@implementation UILabel (PJBAdditons)

- (NSValue *)clickRangeValue
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setClickRangeValue:(NSValue *)clickRangeValue
{
    objc_setAssociatedObject(self, @selector(clickRangeValue), clickRangeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (SingleTapBlock)tapBlock
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTapBlock:(SingleTapBlock)tapBlock
{
    objc_setAssociatedObject(self, @selector(tapBlock), tapBlock, OBJC_ASSOCIATION_COPY);
}
- (NSTextContainer *)textContainer
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTextContainer:(NSTextContainer *)textContainer
{
    objc_setAssociatedObject(self, @selector(textContainer), textContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutManager *)layoutManager
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLayoutManager:(NSLayoutManager *)layoutManager
{
    objc_setAssociatedObject(self, @selector(layoutManager), layoutManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)addTapGestrureAction:(SingleTapBlock)tapBlock{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    [self addGestureRecognizer:tap];
    
    self.tapBlock = tapBlock;
}
- (void)tapGestureAction:(UITapGestureRecognizer *)tapGesture{
    CGSize labelSize = self.bounds.size;
    // create instances of NSLayoutManager, NSTextContainer and NSTextStorage
    if (!self.layoutManager) {
        self.layoutManager = [[NSLayoutManager alloc] init];
    }
    if (!self.textContainer) {
        self.textContainer = [[NSTextContainer alloc] initWithSize:CGSizeZero];
        self.textContainer.lineFragmentPadding = 0.0;
        self.textContainer.lineBreakMode = self.lineBreakMode;
        self.textContainer.maximumNumberOfLines = self.numberOfLines;
        self.textContainer.size = labelSize;
    }
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self.attributedText];
    
    // configure layoutManager and textStorage
    [self.layoutManager addTextContainer:self.textContainer];
    [textStorage addLayoutManager:self.layoutManager];
    // find the tapped character location and compare it to the specified range
    CGPoint locationOfTouchInLabel = [tapGesture locationInView:self];
    CGRect textBoundingBox = [self.layoutManager usedRectForTextContainer:self.textContainer];
    CGPoint textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                              (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
    CGPoint locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
                                                         locationOfTouchInLabel.y - textContainerOffset.y);
    NSInteger indexOfCharacter = [self.layoutManager characterIndexForPoint:locationOfTouchInTextContainer
                                                       inTextContainer:self.textContainer
                              fractionOfDistanceBetweenInsertionPoints:nil];
    NSLog(@"%ld",(long)indexOfCharacter);
    NSLog(@"%@",NSStringFromRange(self.clickRangeValue.rangeValue));
    
    if (NSLocationInRange(indexOfCharacter, self.clickRangeValue.rangeValue)) {
        self.tapBlock();
    }
}

@end
