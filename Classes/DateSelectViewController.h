//
//  DateSelectViewController.h
//  divorce_ios
//
//  Created by liuyu on 15-1-4.
//  Copyright (c) 2015年 liuyu. All rights reserved.
//


@class DateSelectViewController;

@protocol DateSelectViewControllerDelegate <NSObject>

- (void)dateSelectViewControllerDelegate:(NSDate *)date :(NSString *)dateString :(DateSelectViewController *)dateSelectViewController;
@end

#import <UIKit/UIKit.h>
#import "./PopoverViewController.h"

@interface DateSelectViewController : UIViewController

@property int tag;

@property (nonatomic, setter = setMaxDate:)NSDate *maxDate;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) id<DateSelectViewControllerDelegate> delegate;
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

