//
//  TimeSelectViewController.h
//  ChiDeKai
//
//  Created by liuyu on 14-11-10.
//  Copyright (c) 2014年 liuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeSelectViewControllerDelegate.h"
#import "PopoverViewController.h"

@interface TimeSelectViewController : UIViewController
@property (nonatomic, setter = setMaxDate:)NSDate *maxDate;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) id<TimeSelectViewControllerDelegate> delegate;
@property (weak, nonatomic) PopoverViewController *popoverVC;
- (CGSize)intrisicSize;
- (IBAction)sureButtonPresssed:(id)sender;

//辅助功能
- (void)setDatePickerType:(UIDatePickerMode)mode;   //时间选择器样式
- (void)setMaxDate:(NSDate *)maxDate;               //设置最大时间
- (void)setMinDate:(NSDate *)minDate;               //设置最小时间
- (void)setDefaultDate:(NSDate *)date;              //设置默认时间
- (void)setDefaultDate:(NSString *)date :(NSString *)dateFormatter; //设置默认时间
@end
