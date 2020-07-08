# LBUserLeadView
用户操作引导，支持引导图完全自定义。

```ObjC
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
```
![]()
