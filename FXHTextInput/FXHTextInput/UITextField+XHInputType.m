//
//  UITextField+XHInputType.m
//  FXHTextInput
//
//  Created by fxh on 2019/11/22.
//  Copyright © 2019 fxh. All rights reserved.
//

#import "UITextField+XHInputType.h"

@interface UITextField ()<UITextFieldDelegate>
{
    NSInteger inputMaxCount;
    XHTextfieldValue textChangeBlock;
    XHTextfieldValue textEndEditBlock;
}
@end

@implementation UITextField (XHInputType)

- (void)monitorTextFiledValue
{
    self.delegate = self;
    [self addTarget:self action:@selector(p_textFieldDidChangeValue:) forControlEvents:UIControlEventValueChanged];
}

//
- (void)setMaxCount:(NSInteger)maxCount
{
    inputMaxCount = maxCount;
}

#pragma mark ---

- (void)p_textFieldDidChangeValue:(UITextField *)textField
{
    NSString *toBeString = textField.text;
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage; //ios7之前使用[UITextInputMode currentInputMode].primaryLanguage
    if ([lang isEqualToString:@"zh-Hans"]) { //中文输入
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {// 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (inputMaxCount !=0 && toBeString.length > inputMaxCount) {
                textField.text = [toBeString substringToIndex:inputMaxCount];
            }
        }else{//有高亮选择的字符串，则暂不对文字进行统计和限制
            
        }
    }else{//中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (inputMaxCount !=0 && toBeString.length > inputMaxCount) {
            textField.text = [toBeString substringToIndex:inputMaxCount];
        }
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textEndEditBlock) {
        textEndEditBlock(textField.text);
    }
}

- (void)xhTextFieldValueChange:(XHTextfieldValue)textFieldValue
{
    if (textFieldValue) {
        textChangeBlock = textFieldValue;
    }
}

- (void)xhTextFieldValueEndEdit:(XHTextfieldValue)textFieldValue
{
    if (textFieldValue) {
        textEndEditBlock = textFieldValue;
    }
}
@end
