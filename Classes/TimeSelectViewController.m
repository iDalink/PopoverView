//
//  TimeSelectViewController.m
//  ChiDeKai
//
//  Created by liuyu on 14-11-10.
//  Copyright (c) 2014年 liuyu. All rights reserved.
//

#import "TimeSelectViewController.h"

@interface TimeSelectViewController ()
{
}
@end

@implementation TimeSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    return CGSizeMake(320, 243);
}
- (IBAction)sureButtonPresssed:(id)sender
{
    [_popoverVC dismissAnimated:YES];
    if ([_delegate respondsToSelector:@selector(timeSelectViewControllerDelegate:)])
    {
        [_delegate timeSelectViewControllerDelegate:_datePicker.date];
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
