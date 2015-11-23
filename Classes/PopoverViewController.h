//
//  PopoverViewController.h
//  ChiDeKai
//
//  Created by liuyu on 14-11-7.
//  Copyright (c) 2014年 liuyu. All rights reserved.
//
typedef enum
{
    NavigationLeft,
    NavigationRight,
    ScreenBottom,
    ScreenTop,
    ScreenFull,
    ScreenCenter
} SpecialPoint;

typedef enum
{
    None,
    BottomToPoint,
    RightTopToLeftBottom,
    LeftTopToRightBottom,
    TopToBottom,
    ScaleCenterPervasion
} PopoverAnimation;

#import <UIKit/UIKit.h>

@interface PopoverViewController : UIViewController
{
    UIView *displayedView;
    
    UIViewController *displayViewController;
    
    NSMutableArray *targetBlocks;
}
@property CGRect displayedFrame;
@property CGSize contentSize;
@property int tag;
@property PopoverAnimation popoverAnimation;
@property (nonatomic) NSTimeInterval animationDuration;
@property (nonatomic, assign) BOOL grayLayer;


- (void)addDismissBlock:(void (^)())dismissBlock;

- (id)initWithView:(UIView *)v;
- (id)initWithViewController:(UIViewController *)vc;
- (void)setContentSize:(CGSize)size;
- (void)presentAtSpecialPoint:(SpecialPoint)specialPoint;
- (void)presentAtPoint:(CGPoint)point;
- (void)dismissAnimated:(BOOL)animate;
@end
