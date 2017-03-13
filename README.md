# LQPopUpView

<P align="center">
![enter image description here](https://img.shields.io/badge/platform-IOS%207.0%2B-ff69b5618733984.svg)

## Introduction

this is a convenient way for you to create a popUpView in your iOS project instead of the system UIAlertView or UIActionSheet. 
if you have some questions or some places wrong in my project, welcome to contact with me, my mailbox is 1522949535@qq.com


## Demonstration

![enter image description here](https://github.com/XIAMOON/LQPopUpView/blob/master/screenShot/alert.gif)
![enter image description here](https://github.com/XIAMOON/LQPopUpView/blob/master/screenShot/actionSheet.gif)


## Usage method

### create method 1:

```
- (IBAction)firstAction:(id)sender {
LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"prompt" message:@"This is the pop-up view created with the first initialization method"];

[popUpView addBtnWithTitle:@"Cancel" type:LQPopUpBtnStyleCancel handler:^{
// do something...
}];

[popUpView addBtnWithTitle:@"Sure" type:LQPopUpBtnStyleDefault handler:^{
// do something...
}];

[popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];
}
```

### create method 2:

```
- (IBAction)secondAction:(id)sender {
LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"prompt" message:@"This is the second way to create, but also a quick way to create, there is not much separation of the code, it is particularly convenient to use, and you can add any button again" cancelButtonTitle:@"取消" otherButtonTitles:@[@"One", @"Two", @"Three"] actionWithIndex:^(NSInteger index) {
// do something...
}];

[popUpView addBtnWithTitle:@"Sure" type:LQPopUpBtnStyleDestructive handler:^{
// do something...
}];

[popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];
}
```

### create method 3:

```
- (IBAction)thirdAction:(id)sender {
LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitleConfiguration:^(TitleConfiguration *configuration) {
configuration.text = @"prompt";
} messageConfiguration:^(MessageConfiguration *configuration) {
configuration.text = @"This is the third way to create, this way can create text, font, font color, the title and message of the upper and lower margins of customization, readily adapt to your needs";
configuration.fontSize = 15.0;
configuration.textColor = [UIColor purpleColor];
configuration.bottom = 25.0;
}];

[popUpView addBtnWithTitle:@"Cancel" type:LQPopUpBtnStyleCancel handler:^{
// do something...
}];

[popUpView addBtnWithTitle:@"Delete" type:LQPopUpBtnStyleDestructive handler:^{
// do something...
}];

[popUpView addBtnWithTitle:@"Sure" type:LQPopUpBtnStyleDefault handler:^{
// do something...
}];
[popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];
}
```
