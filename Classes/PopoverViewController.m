//
//  PopoverViewController.m
//  ChiDeKai
//
//  Created by liuyu on 14-11-7.
//  Copyright (c) 2014年 liuyu. All rights reserved.
//

#import "PopoverViewController.h"
#import "PopoverBorderView.h"

#define NAVIGATIONBAR_HEIGHT 64
@interface PopoverViewController ()
{
    UIView *backgroundView;
}
@end

@implementation PopoverViewController
- (id)initWithView:(UIView *)v
{
    displayedView = v;
    UITapGestureRecognizer *nizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundPressed:)];
    [self.view addSubview:v];
    //backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //[backgroundView addSubview:v];
    [self.view addGestureRecognizer:nizer];
    
    PopoverBorderView *borderView = [[PopoverBorderView alloc] initWithFrame:CGRectMake(0, 100, 10, 10)];
    [self.view addSubview:borderView];
    borderView.myViewController = self;
    self.animationDuration = 0.2;
    return [super init];
}

- (id)initWithViewController:(UIViewController *)vc
{
    self = [self initWithView:vc.view];
    displayViewController = vc;
    self.animationDuration = 0.2;
    return self;
}

- (void)presentAtSpecialPoint:(SpecialPoint)specialPoint
{
    CGPoint point;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    switch (specialPoint) {
        case ScreenCenter:
            point = CGPointMake((screenWidth - _contentSize.width)/2, (screenHeight - _contentSize.height)/2);
            break;
        case NavigationLeft:
            point = CGPointMake(0, NAVIGATIONBAR_HEIGHT);
            break;
        case NavigationRight:
            point = CGPointMake(screenWidth - _contentSize.width, NAVIGATIONBAR_HEIGHT);
            break;
        case ScreenBottom:
            point = CGPointMake(0, screenHeight - _contentSize.height);
            break;
        case ScreenTop:
            point = CGPointMake(0, 0);
            break;
        case ScreenFull:
            point = CGPointMake(0, 0);
            break;
        default:
            break;
    }
    [self presentAtPoint:point];
}
- (void)presentAtPoint:(CGPoint)point
{
    UIWindow *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    NSArray *rootViews = window.subviews;
    UIView *rootView = [rootViews firstObject];
    
    CGRect rect = CGRectMake(point.x, point.y, _contentSize.width, _contentSize.height);
    
    switch (_popoverAnimation) {
        case None:
        {
            displayedView.frame = rect;
        }
            break;
        case BottomToPoint:
        {
            CGRect orginaryRect = rect;
            orginaryRect.origin.y = [UIScreen mainScreen].bounds.size.height;
            displayedView.frame = orginaryRect;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.frame = rect;
            [UIView commitAnimations];
        }
            break;
        case RightTopToLeftBottom:
        {
            [displayedView.layer setAnchorPoint:CGPointMake(1, 0)];
            displayedView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
            displayedView.frame = rect;
            displayedView.transform = CGAffineTransformMake(0, 0, 0, 0, 1, 0);
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
            [UIView commitAnimations];
        }
            break;
        case LeftTopToRightBottom:
        {
            [displayedView.layer setAnchorPoint:CGPointMake(0, 0)];
            displayedView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
            displayedView.frame = rect;
            displayedView.transform = CGAffineTransformMake(0, 0, 0, 0, 0, 0);
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
            [UIView commitAnimations];
        }
        case TopToBottom:
        {
            [displayedView.layer setAnchorPoint:CGPointMake(0, 0)];
            displayedView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
            displayedView.frame = rect;
            displayedView.transform = CGAffineTransformMakeScale(1, 0);
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
            [UIView commitAnimations];
        }
            break;
        case ScaleCenterPervasion:
        {
            displayedView.frame = rect;
            displayedView.layer.anchorPoint = CGPointMake(0.5, 0.5);
            displayedView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            
            displayedView.transform = CGAffineTransformMakeScale(1, 1);
            [UIView commitAnimations];
        }
            break;
        default:
            break;
    }
    
    [rootView addSubview:self.view];
}
- (void)dismissAnimated:(BOOL)animate
{
    switch (_popoverAnimation){
        case BottomToPoint:
        {
            CGRect objectRect = displayedView.frame;
            objectRect.origin.y = [UIScreen mainScreen].bounds.size.height;
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.frame = objectRect;
            [UIView commitAnimations];
            
            [self.view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:self.animationDuration];
        }
            break;
        case RightTopToLeftBottom:
        {
            //[displayedView.layer setAnchorPoint:CGPointMake(1, 0)];
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.transform = CGAffineTransformMake(0, 0, 0, 0, 1, 0);
            [UIView commitAnimations];
            
            [self.view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:self.animationDuration];
        }
            break;
        case LeftTopToRightBottom:
        {
            //[displayedView.layer setAnchorPoint:CGPointMake(1, 0)];
            
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.transform = CGAffineTransformMake(0, 0, 0, 0, 0, 0);
            [UIView commitAnimations];
            
            [self.view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:self.animationDuration];
        }
            break;
        case TopToBottom:
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.transform = CGAffineTransformMakeScale(1, 0);
            [UIView commitAnimations];
            
            [self.view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:self.animationDuration];
        }
            break;
        case ScaleCenterPervasion:
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:self.animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            displayedView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            [UIView commitAnimations];
            
            [self.view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:self.animationDuration];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, _animationDuration*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    
                    displayedView.transform = CGAffineTransformMakeScale(1, 1);
                });
        }
            break;
        case None:
        {
            [self.view removeFromSuperview];
        }
            break;
    }
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, _animationDuration*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        for (void (^block)() in targetBlocks)
        {
            block();
        }
//    });
}
- (void)backgroundPressed:(id)sender
{
    [self dismissAnimated:YES];
}

- (void)addDismissBlock:(void (^)())dismissBlock
{
    if (targetBlocks == nil)
    {
        targetBlocks = [NSMutableArray array];
    }
    [targetBlocks addObject:dismissBlock];
}
- (void)setGrayLayer:(BOOL)grayLayer
{
    _grayLayer = grayLayer;
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
}
@end
