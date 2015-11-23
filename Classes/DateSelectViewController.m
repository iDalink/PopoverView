//
//  DateSelectViewController.m
//  divorce_ios
//
//  Created by liuyu on 15-1-4.
//  Copyright (c) 2015年 liuyu. All rights reserved.
//

#import "DateSelectViewController.h"

@interface DateSelectViewController ()

@end

@implementation DateSelectViewController

- (void)setMaxDate:(NSDate *)maxDate
{
    _maxDate = maxDate;
    [_datePicker setMaximumDate:maxDate];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_button.layer setCornerRadius:5];
    //_button.layer.borderColor = [UIColor colorWithRed:102.0/255.0 green:204.0/255.0 blue:1 alpha:1.0].CGColor;
    _button.layer.borderColor = [UIColor colorWithRed:.0/255.0 green:.0/255.0 blue:0 alpha:1.0].CGColor;
    _button.layer.borderWidth = 0.5;
}

- (CGSize)intrisicSize
{
    return CGSizeMake(320, 212);
}

- (IBAction)sureButtonPresssed:(id)sender
{
    [_popoverVC dismissAnimated:YES];
    if ([_delegate respondsToSelector:@selector(dateSelectViewControllerDelegate:::)])
    {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:_datePicker.date];
        
        [_delegate dateSelectViewControllerDelegate:_datePicker.date :dateString :self];
    }
}

- (void)setDatePickerType:(UIDatePickerMode)mode
{
    [_datePicker setDatePickerMode:mode];
}

- (void)setMinDate:(NSDate *)minDate
{
    [_datePicker setMinimumDate:minDate];
}

- (void)setDefaultDate:(NSDate *)date
{
    [self.datePicker setDate:date];
}

- (void)setDefaultDate:(NSString *)date :(NSString *)dateFormatter
{
    NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:dateFormatter];
    NSDate *dateTime = [_dateFormatter dateFromString:date];
    [_datePicker setDate:dateTime];
}
@end
