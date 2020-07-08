//
//  ViewController.m
//  LBUserLeadViewExample
//
//  Created by 刘彬 on 2020/7/8.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import "ViewController.h"
#import "LBUserLeadView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [@[@"第一步",@"下一步"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-80)/2, 100+idx*(40+25), 80, 40)];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.tag = idx+100;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(showUserLead:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    
    
}
-(void)showUserLead:(UIButton *)sender{
    LBUserLeadView *leadView = [[LBUserLeadView alloc] init];
    leadView.lb_lightType = LBLeadHighlightTypeRect;
    leadView.lb_sourceRect = sender.frame;
    
    UILabel *hintLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(sender.frame)+25, CGRectGetMaxX(sender.frame)-15, 80)];
    hintLabel.numberOfLines = 0;
    hintLabel.backgroundColor = [UIColor magentaColor];
    hintLabel.text = @"这是一个自定义view，可以摆放在任何位置";
    leadView.lb_customView = hintLabel;
    
    [leadView showLeadInView:self.view completionHandler:^{
        if (sender.tag == 100) {
            [self showUserLead:[self.view viewWithTag:101]];
        }
    }];
}

@end
