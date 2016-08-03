//
//  ViewController.m
//  XJPassworkView
//
//  Created by gn_macMini_liao on 16/8/3.
//  Copyright © 2016年 gn_macMini_liao. All rights reserved.
//

#import "ViewController.h"
#import "XJPwdView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    XJPwdView *pwdView = [[XJPwdView alloc] initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH - 20, 40)];
    [self.view addSubview:pwdView];
    
    WEAKSELF
    pwdView.noneBlock = ^(NSString *pwd){
        
    STRONGSELF
        [strongSelf log:pwd];
    };
}

-(void)log:(NSString*)pwd{
    
    NSLog(@"noneBlock =========== %@",pwd);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
