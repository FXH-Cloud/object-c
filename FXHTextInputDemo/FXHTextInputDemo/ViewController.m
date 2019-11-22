//
//  ViewController.m
//  FXHTextInputDemo
//
//  Created by fxh on 2019/11/21.
//  Copyright © 2019 fxh. All rights reserved.
//

#import "ViewController.h"
#import "XHInputTextField.h"

@interface ViewController ()
{
    XHInputTextField *textField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewEndEdit)];
    [self.view addGestureRecognizer:tap];
    
    textField = [[XHInputTextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    textField.borderStyle = UITextBorderStyleBezel;
    [textField setMaxCount:10];
//    [textField monitorTextFiledValue];
    [textField xhTextFieldValueEndEdit:^(NSString * _Nonnull text) {
        NSLog(@"text end Edit = %@ ",text);
    }];
    
    [textField xhTextFieldValueChange:^(NSString * _Nonnull text) {
        NSLog(@"text value change = %@",text);
    }];
    
    [self.view addSubview:textField];
}

- (void)tapViewEndEdit
{
    [self.view endEditing:YES];
}

@end
