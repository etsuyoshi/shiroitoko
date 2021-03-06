//
//  SHTile.m
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import "SHTile.h"

@implementation SHTile
//@synthesize viewTile;
@synthesize isOn;
//@synthesize myColor;

UIColor *myBlackColor;
UIColor *myWhiteColor;
UIColor *myRedColor;


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self) {
        myBlackColor = [[UIColor blackColor] colorWithAlphaComponent:0.9f];
        myWhiteColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
        self.isOn = NO;
//        self.myColor = myWhiteColor;
//        self.viewTile = [[UIView alloc]initWithFrame:frame];
        self.backgroundColor = myWhiteColor;
    }
    
    return self;
    
}



-(void)changeColor{
    if([self.backgroundColor isEqual:myWhiteColor]){
        self.backgroundColor = myBlackColor;
    }else{
        self.backgroundColor = myWhiteColor;
    }
    
    self.isOn = !self.isOn;
    
}


-(void)resetColor{
    self.backgroundColor = myWhiteColor;
    self.isOn = false;
}




@end
