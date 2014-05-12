//
//  SH.h
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/13.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TouchesDelegate

@optional
- (void)view:(UIView*)view touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
- (void)view:(UIView*)view touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event;
- (void)view:(UIView*)view touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event;
- (void)view:(UIView*)view touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event;

@end