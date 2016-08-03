//
//  CTPwdView.h
//  密码输入界面
//
//  Created by gn_macMini_liao on 16/3/31.
//  Copyright © 2016年 gn_macMini_liao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PWD_MAX_LENGTH 6
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

// block self 防止内存泄漏
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

@interface XJPwdView : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *pwdTF;

/**
 *  输入限制的长度后返回输入的字符串
 */
@property (nonatomic, copy) void (^noneBlock)(NSString *pwd);

/**
 *  删除黑点imageView
 */
-(void)removeDotImages;

@end
