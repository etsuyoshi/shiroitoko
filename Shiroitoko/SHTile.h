//
//  SHTile.h
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHTile : NSObject
@property(nonatomic) UIView *viewTile;
@property(nonatomic) BOOL isOn;
//@property(nonatomic) UIColor myColor;

-(id)initWithFrame:(CGRect)rect;
-(void)changeColor;

@end
