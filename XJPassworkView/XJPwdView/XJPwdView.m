//
//  CTPwdView.m
//  密码输入界面
//
//  Created by gn_macMini_liao on 16/3/31.
//  Copyright © 2016年 gn_macMini_liao. All rights reserved.
//

#import "XJPwdView.h"

@interface XJPwdView ()

@property (nonatomic, strong) NSMutableArray *imageViews;//存放点的图片数组

@end

@implementation XJPwdView


-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _imageViews  = [NSMutableArray array];
         self.frame = frame;
        [self creatView];

    }
    
    return self;
}

#pragma mark -创建视图
-(void)creatView{
    
    //输入框 仅仅是为了弹出键盘 所以不需要frame
    _pwdTF = [[UITextField alloc] init];
    _pwdTF.keyboardType = UIKeyboardTypeNumberPad;
    [_pwdTF becomeFirstResponder];
    [self addSubview:_pwdTF];
    
    //添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange) name:UITextFieldTextDidChangeNotification object:nil];
    
    //加载label的视图
    UIView *labelsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:labelsView];
    labelsView.backgroundColor = [UIColor whiteColor];
    labelsView.layer.borderWidth = 1;
    labelsView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    CGFloat LB_widtn = (self.frame.size.width) / PWD_MAX_LENGTH;
    UILabel *label;
    for (int i = 0; i< PWD_MAX_LENGTH; i++) {
        
        //创建label是为了计算黑点图片的center
        CGRect frame = CGRectMake(LB_widtn * i, 0, LB_widtn, self.frame.size.height);
        label = [[UILabel alloc] initWithFrame:frame];
        [self addSubview:label];
        
        //创建黑点imageView
        UIImageView *iv = [[UIImageView alloc] init];
        iv.frame = CGRectMake(0, 0, 10, 10);
        iv.center = label.center;
        [labelsView addSubview:iv];

        //分隔的线条，
        CGFloat lineX = 0.0;
        if (i == 0) {
            
            lineX = frame.size.width;
            
        }else{
            
            lineX = frame.origin.x;
        }
        UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(lineX, label.frame.origin.y, 1, label.frame.size.height)];
        rightLine.backgroundColor = [UIColor lightGrayColor];
        [labelsView addSubview:rightLine];

         [_imageViews addObject:iv];
    }
    
}

#pragma mark -输入文本或删除文本时触发
-(void)textFieldTextDidChange{
    
    //限制textfield可输入长度
    if (_pwdTF.text.length > PWD_MAX_LENGTH){
        _pwdTF.text = [_pwdTF.text substringToIndex:PWD_MAX_LENGTH];
        return;

    }
    [self removeImages];
    
    //创建黑点imageView
    for (int i = 0; i < _pwdTF.text.length; i++) {
        
        UIImageView *iv = _imageViews[i];
        [iv setImage:[UIImage imageNamed:@"password_dot"]];
    }
    
    //输入 PWD_MAX_LENGTH 长度后把输入的字符串返回
    if (_pwdTF.text.length >= PWD_MAX_LENGTH) {
        
        if (self.noneBlock) {
            self.noneBlock(_pwdTF.text);
        }
        //清空数据
        [self removeDotImages];
    }
    
}

#pragma mark - 删除黑色的点
- (void)removeImages{
    for (UIImageView *iv in _imageViews) {
        [iv setImage:[UIImage imageNamed:@""]];
    }
}

-(void)removeDotImages{
    _pwdTF.text = @"";
    [self removeImages];
}


@end
