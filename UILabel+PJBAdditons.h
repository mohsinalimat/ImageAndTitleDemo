//
//  UILabel+PJBAdditons.h
//  PJ
//
//  Created by WeiHu on 2017/3/16.
//  Copyright © 2017年 dj0708. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSMutableAttributedString+PJBAdditions.h"

typedef void(^SingleTapBlock)();

@interface UILabel (PJBAdditons)
@property (nonatomic, copy) SingleTapBlock tapBlock;
@property (nonatomic, strong) NSValue *clickRangeValue;
@property (nonatomic, strong) NSTextContainer *textContainer;
@property (nonatomic, strong) NSLayoutManager *layoutManager;
- (void)addTapGestrureAction:(SingleTapBlock)tapBlock;

@end
