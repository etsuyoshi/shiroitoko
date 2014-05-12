//
//  SHTouchPanel.h
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/13.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchesDelegate.h"

@interface SHTouchPanel : UIView{
    id<TouchesDelegate> delegate;
}

@property (nonatomic, retain) id delegate;
@end
