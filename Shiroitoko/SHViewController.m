//
//  SHViewController.m
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import "SHViewController.h"

@interface SHViewController ()

@end

@implementation SHViewController

NSMutableArray *arrTile;
int widthTile;
int heightTile;

int totalColumnNum;//列数
int totalRowNum;//行数


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    arrTile = [NSMutableArray array];
    
    int x0 = 0;
    int y0 = 0;
    
    widthTile = self.view.bounds.size.width/4;
    heightTile = self.view.bounds.size.height/4;
    totalColumnNum = 4;
    totalRowNum = 4;
    
    NSMutableArray *arrTmpTile = [NSMutableArray array];
    BOOL isAlreadyOn = false;//既にオフのブロックがないか(一列の中でどれかはオンにならなければならない)
    for(int j = 0;j < totalRowNum;j++){
        arrTmpTile = [NSMutableArray array];
        isAlreadyOn = NO;
        for(int i = 0; i < totalColumnNum;i ++){
            x0 = i * widthTile;
            y0 = j * heightTile;
            SHTile *myTile = [[SHTile alloc]initWithFrame:CGRectMake(x0, y0, widthTile, heightTile)];
            if(arc4random() % totalColumnNum == 0 && !isAlreadyOn){
                [myTile changeColor];
                isAlreadyOn = YES;
                NSLog(@"%d列目の%d行目がオン", j,i);
            }else if(i == totalColumnNum - 1){
                [myTile changeColor];
                isAlreadyOn = YES;//あまり意味ないけど
                NSLog(@"%d列目の%d行目がオン", j,i);
            }
            [arrTmpTile addObject:myTile];
        }
        
        [arrTile addObject:arrTmpTile];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    for(int j = 0;j < [arrTile count];j++){
        for(int i = 0 ; i < [arrTile[j] count];i++){
            [self.view addSubview:((SHTile *)arrTile[j][i]).viewTile];
            NSLog(@"view[%d][%d] = %@", j,i,((SHTile *)arrTile[j][i]).viewTile);
        }
    }
}

@end
