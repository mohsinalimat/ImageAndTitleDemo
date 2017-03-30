# ImageAndTitleDemo
 1 例子效果
 ![image](https://github.com/evernoteHW/ImageAndTitleDemo/blob/master/demo.png)
 2 如何使用 
 // 图片在上边 + 文字在下边
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(4, 20, 100, 80)];
    view1.backgroundColor = [UIColor orangeColor];
    [view1 setImageLocation:PJBImageLocationCenterUp
                   interval:0
                      image:[UIImage imageNamed:@"ICON"]
             attributedText:[[NSAttributedString alloc] initWithString:@"图片在上边 + 文字在下边"]
                    spacing:0];
    view1.pjTitleLabel.textColor = [UIColor whiteColor];
    view1.pjTitleLabel.font = [UIFont systemFontOfSize:12];
    view1.pjTitleLabel.numberOfLines = 2;
    [self.view addSubview:view1];
    
    // 图片在左边 + 文字在右边
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(4, 120, 150, 80)];
    view2.backgroundColor = [UIColor orangeColor];
    [view2 setImageLocation:PJBImageLocationCenterLeft
                   interval:0
                      image:[UIImage imageNamed:@"ICON"]
             attributedText:[[NSAttributedString alloc] initWithString:@"图片在左边 + 文字在右边"]
                    spacing:0];
    view2.pjTitleLabel.textColor = [UIColor whiteColor];
    view2.pjTitleLabel.font = [UIFont systemFontOfSize:12];
    view2.pjTitleLabel.numberOfLines = 2;
    [self.view addSubview:view2];
    
    // 图片在下边 + 文字在上边
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(4, 220, 100, 80)];
    view3.backgroundColor = [UIColor orangeColor];
    [view3 setImageLocation:PJBImageLocationCenterDown
                   interval:0
                      image:[UIImage imageNamed:@"ICON"]
             attributedText:[[NSAttributedString alloc] initWithString:@"图片在下边 + 文字在上边"]
                    spacing:0];
    view3.pjTitleLabel.textColor = [UIColor whiteColor];
    view3.pjTitleLabel.font = [UIFont systemFontOfSize:12];
    view3.pjTitleLabel.numberOfLines = 2;
    [self.view addSubview:view3];
    
    // 图片在右边 + 文字在左边
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(4, 320, 150, 80)];
    view4.backgroundColor = [UIColor orangeColor];
    [view4 setImageLocation:PJBImageLocationCenterRight
                   interval:-10
                      image:[UIImage imageNamed:@"ICON"]
             attributedText:[[NSAttributedString alloc] initWithString:@"图片在右边 + 文字在左边"]
                    spacing:-10];
    view4.pjTitleLabel.textColor = [UIColor whiteColor];
    view4.pjTitleLabel.font = [UIFont systemFontOfSize:12];
    view4.pjTitleLabel.numberOfLines = 2;
    [self.view addSubview:view4];
    
    view4.pjTapBlock = ^(){
        NSLog(@"你点我干吗！");
    };
    
    
    // 图片在左边 + 文字在右边 + 字体不一样大小
    
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(4, 410, 300, 80)];
    view5.backgroundColor = [UIColor orangeColor];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    
    AttributedLayoutModel *model1 = [[AttributedLayoutModel alloc] init];
    model1.text = @"第一段文字";
    model1.textFont = [UIFont systemFontOfSize:14];
    model1.textColor = [UIColor whiteColor];
    
    AttributedLayoutModel *model2 = [[AttributedLayoutModel alloc] init];
    model2.text = @"第二段文字";
    model2.textFont = [UIFont boldSystemFontOfSize:18];
    model2.textColor = [UIColor yellowColor];
    
    
    AttributedLayoutModel *model3 = [[AttributedLayoutModel alloc] init];
    model3.text = @"第三段文字";
    model3.textFont = [UIFont boldSystemFontOfSize:14];
    model3.textColor = [UIColor redColor];
    
    [attributedText setDirection:AttributeDirectionHorizontal
                layoutModelArray:@[model1,model2,model3]
                         spacing:10
                       alignment:NSTextAlignmentCenter];
    
    [view5 setImageLocation:PJBImageLocationCenterLeft
                   interval:0
                      image:[UIImage imageNamed:@"ICON"]
             attributedText:attributedText
                    spacing:0];
    
    [self.view addSubview:view5];
    
    // 图片在左边 + 文字在右边 + 字体不一样大小
    
    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(200, 20, 150, 150)];
    view6.backgroundColor = [UIColor orangeColor];
    
    NSMutableAttributedString *attributedText1 = [[NSMutableAttributedString alloc] init];
    
    AttributedLayoutModel *model4 = [[AttributedLayoutModel alloc] init];
    model4.text = @"1 第一段文字";
    model4.textFont = [UIFont systemFontOfSize:14];
    model4.textColor = [UIColor whiteColor];
    model4.textSpacing = 5;
    model4.textAlignment = NSTextAlignmentLeft;
    
    AttributedLayoutModel *model5 = [[AttributedLayoutModel alloc] init];
    model5.text = @"2 第二段文字";
    model5.textFont = [UIFont boldSystemFontOfSize:18];
    model5.textColor = [UIColor yellowColor];
    model5.textSpacing = 10;
    model5.textAlignment = NSTextAlignmentCenter;
    
    AttributedLayoutModel *model6 = [[AttributedLayoutModel alloc] init];
    model6.text = @"3 第三段文字";
    model6.textFont = [UIFont boldSystemFontOfSize:14];
    model6.textColor = [UIColor redColor];
    model6.textSpacing = 20;
    model6.textAlignment = NSTextAlignmentRight;
    
    
//    [attributedText1 setDirection:AttributeDirectionVertical
//                layoutModelArray:@[model4,model5,model6]
//                         spacing:10
//                       alignment:NSTextAlignmentCenter];
    [attributedText1 setDirection:AttributeDirectionVertical
                 layoutModelArray:@[model4,model5,model6]];
    
    [view6 setImageLocation:PJBImageLocationCenterUp
                   interval:0
                      image:[UIImage imageNamed:@"ICON"]
             attributedText:attributedText1
                    spacing:0];
    
    [self.view addSubview:view6];
    
    
    
    // 图片在左边 + 文字在右边 + 字体不一样大小
    
    UIView *view7 = [[UIView alloc] initWithFrame:CGRectMake(200, 180, 150, 150)];
    view7.backgroundColor = [UIColor orangeColor];
    
    NSMutableAttributedString *attributedText2 = [[NSMutableAttributedString alloc] init];
    
    AttributedLayoutModel *model7 = [[AttributedLayoutModel alloc] init];
    model7.text = @"1 第一段文字";
    model7.textFont = [UIFont systemFontOfSize:14];
    model7.textColor = [UIColor whiteColor];
    model7.textSpacing = 5;
    model7.textAlignment = NSTextAlignmentLeft;
    
    AttributedLayoutModel *model8 = [[AttributedLayoutModel alloc] init];
    model8.text = @"2 第二段文字";
    model8.textFont = [UIFont boldSystemFontOfSize:18];
    model8.textColor = [UIColor yellowColor];
    model8.textSpacing = 10;
    model8.textAlignment = NSTextAlignmentCenter;
    
    AttributedLayoutModel *model9 = [[AttributedLayoutModel alloc] init];
    model9.text = @"3 第三段文字";
    model9.textFont = [UIFont boldSystemFontOfSize:14];
    model9.textColor = [UIColor redColor];
    model9.textSpacing = 20;
    model9.textAlignment = NSTextAlignmentRight;
    
    
    [attributedText2 setDirection:AttributeDirectionVertical
                layoutModelArray:@[model7,model8,model9]
                         spacing:10
                       alignment:NSTextAlignmentCenter];
    
    [view7 setImageLocation:PJBImageLocationCenterUp
                   interval:0
                      image:[UIImage imageNamed:@"ICON"]
             attributedText:attributedText2
                    spacing:0];
    
    [self.view addSubview:view7];
    
