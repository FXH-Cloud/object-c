/*
 * UITextField+XHInputType.h
 * 该分类为处理检测当前的控制最大输入数量
 *
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^XHTextfieldValue)(NSString *text);

@interface XHInputTextField:UITextField

//
//@property(nonatomic, assign) NSInteger minCount;

- (void)monitorTextFiledValue;

//限制最大字数
- (void)setMaxCount:(NSInteger)maxCount;

- (void)xhTextFieldValueChange:(XHTextfieldValue)textFieldValue;

- (void)xhTextFieldValueEndEdit:(XHTextfieldValue)textFieldValue;

@end

NS_ASSUME_NONNULL_END
