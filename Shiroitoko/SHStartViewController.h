//
//  SHStartViewController.h
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHViewController.h"
#import "SHSumViewController.h"
#import "SHSpeedViewController.h"

@interface SHStartViewController : UIViewController{
    int nextGameType;
}
@property (nonatomic) NSTimer *timer;
@property int nextGameType;
@end
