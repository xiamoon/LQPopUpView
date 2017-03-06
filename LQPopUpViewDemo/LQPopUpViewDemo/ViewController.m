//
//  ViewController.m
//  LQPopUpViewDemo
//
//  Created by dayHR on 17/3/3.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import "ViewController.h"
#import "LQPopUpView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _segmentControl.selectedSegmentIndex = 0;
}

- (IBAction)segmentControlAction:(UISegmentedControl *)sender {
    
}

- (IBAction)firstAction:(id)sender {
    LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"提示" message:@"这是用第一种初始化方法创建的弹出视图"];

    [popUpView addBtnWithTitle:@"取消" type:LQPopUpBtnStyleCancel handler:^{
        // do something...
    }];
    
    [popUpView addBtnWithTitle:@"确定" type:LQPopUpBtnStyleDefault handler:^{
        // do something...
    }];
    
    [popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];
}


- (IBAction)secondAction:(id)sender {
    LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"提示" message:@"这是第二种创建方式，也是一种快捷创建方式，没有太多的代码分离，使用起来特别方便，而且你可以单独再次加入任何按钮" cancelButtonTitle:@"取消" otherButtonTitles:@[@"提示一次", @"提示两次", @"确定"] actionWithIndex:^(NSInteger index) {
        // do something...
    }];
    
    [popUpView addBtnWithTitle:@"单独加入的按钮" type:LQPopUpBtnStyleDestructive handler:^{
        // do something...
    }];
    
    [popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];
}


- (IBAction)thirdAction:(id)sender {
    LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitleConfiguration:^(TitleConfiguration *configuration) {
        configuration.text = @"提示";
    } messageConfiguration:^(MessageConfiguration *configuration) {
        configuration.text = @"这是第三种创建方式，这个创建方式可以对title和message的文本、字号、字体颜色、文本上下边距进行定制，随时适应您的需求";
        configuration.fontSize = 15.0;
        configuration.textColor = [UIColor purpleColor];
        configuration.bottom = 25.0;
    }];
    
    [popUpView addBtnWithTitle:@"取消" type:LQPopUpBtnStyleCancel handler:^{
        // do something...
    }];
    
    [popUpView addBtnWithTitle:@"我知道了" type:LQPopUpBtnStyleDestructive handler:^{
        // do something...
    }];
    
    [popUpView addBtnWithTitle:@"确定" type:LQPopUpBtnStyleDefault handler:^{
        // do something...
    }];
    [popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];
}


- (IBAction)TextField:(UIButton *)sender {
    LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"提示" message:@"在做账号密码登录时，可以选择这种方式"];
    __weak typeof(LQPopUpView) *weakPopUpView = popUpView;
    
    [popUpView addTextFieldWithPlaceholder:@"请输入您的账号/手机号/邮箱" secureEntry:NO];
    [popUpView addTextFieldWithPlaceholder:@"请输入您的密码" secureEntry:YES];
    [popUpView addTextFieldWithPlaceholder:@"请再次确认您的密码" secureEntry:YES];
    
    [popUpView addBtnWithTitle:@"取消" type:LQPopUpBtnStyleCancel handler:^{
        // do something...
    }];
    
    [popUpView addBtnWithTitle:@"确定" type:LQPopUpBtnStyleDefault handler:^{
        // do something...
        for (int i = 0; i < weakPopUpView.textFieldArray.count; i ++) {
            UITextField *tf = weakPopUpView.textFieldArray[i];
            NSLog(@"第%d个输入框的文字是：%@", i, tf.text);
        }
    }];
    [popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
