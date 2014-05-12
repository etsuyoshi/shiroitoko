//
//  SHTouchPanel.m
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/13.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import "SHTouchPanel.h"

@implementation SHTouchPanel
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/**
 * タッチされたとき
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesBegan");
	[delegate view:self touchesBegan:touches withEvent:event];
}

- (void)touchesMoved: (NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesMoved");
	[delegate view:self touchesMoved:touches withEvent:event];
}

- (void)touchesEnded: (NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesEnded");
	[delegate view:self touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesCancelled");
	[delegate view:self touchesCancelled:touches withEvent:event];
}

@end
