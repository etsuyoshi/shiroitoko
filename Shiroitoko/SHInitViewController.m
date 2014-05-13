//
//  SHInitViewController.m
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import "SHInitViewController.h"

@interface SHInitViewController ()

@end

@implementation SHInitViewController

int widthButton = 260;
int heightButton = 50;
int initXButton = 30;
int initYButton = 130;
int intervalButton = 20;
HTPressableButton *game10sec;
HTPressableButton *gameSummation;
HTPressableButton *gameSpeed;
HTPressableButton *gameMulti;
HTPressableButton *dispMyRecord;
HTPressableButton *dispWorldRecord;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grassColor];
    
    //10秒でどこまでいけるか
    game10sec = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    game10sec.frame = CGRectMake(initXButton, initYButton, widthButton, heightButton);
    game10sec.style = HTPressableButtonStyleRounded;
    [game10sec setTitle:@"10seconds" forState:UIControlStateNormal];
    game10sec.tag = 0;
    [game10sec addTarget:self
                          action:@selector(buttonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:game10sec];
    
    
    
    //間違えてもいいから総時間内に取得したタイルの数：連続して正解すると＋２点とか。
    //すんどめ
    //与えられたタイミングで取得する
    //複数の指を使う
    //取得可能タイルが複数
    //逆向き方向
    //ダブルタッチ、トリプルタッチ
    gameSummation = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    gameSummation.frame = CGRectMake(initXButton, initYButton + heightButton + intervalButton,
                                     widthButton, heightButton);
    gameSummation.style = HTPressableButtonStyleRounded;
    gameSummation.buttonColor = [UIColor amethystColor];
    gameSummation.shadowColor = [UIColor lavenderDarkColor];
    [gameSummation setTitle:@"Summation" forState:UIControlStateNormal];
    gameSummation.tag = 1;
    [gameSummation addTarget:self
                          action:@selector(buttonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gameSummation];
    
    
    
    //50個を取得するのに要する時間
    gameSpeed = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    gameSpeed.frame = CGRectMake(initXButton, initYButton + (heightButton + intervalButton) * 2,
                                     widthButton, heightButton);
    gameSpeed.style = HTPressableButtonStyleRounded;
    gameSpeed.buttonColor = [UIColor alizarinColor];
    gameSpeed.shadowColor = [UIColor pomegranateColor];
    [gameSpeed setTitle:@"Speed" forState:UIControlStateNormal];
    gameSpeed.tag = 2;
    [gameSpeed addTarget:self
                      action:@selector(buttonPressed:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gameSpeed];
    
    
    
    gameMulti = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    gameMulti.frame = CGRectMake(initXButton, initYButton + (heightButton + intervalButton) * 3,
                                    widthButton, heightButton);
    gameMulti.style = HTPressableButtonStyleRounded;
    gameMulti.buttonColor = [UIColor sunflowerColor];
    gameMulti.shadowColor = [UIColor citrusColor];
    [gameMulti setTitle:@"multiple" forState:UIControlStateNormal];
    gameMulti.tag = 3;
    [gameMulti addTarget:self
                     action:@selector(buttonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gameMulti];
    
    
    //左
    dispMyRecord = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    dispMyRecord.frame = CGRectMake(initXButton, initYButton + (heightButton + intervalButton) * 4,
                                    widthButton/3, heightButton);
    dispMyRecord.style = HTPressableButtonStyleRounded;
    dispMyRecord.buttonColor = [UIColor leadColor];
    dispMyRecord.shadowColor = [UIColor leadDarkColor];
    [dispMyRecord setTitle:@"My Rec" forState:UIControlStateNormal];
    dispMyRecord.tag = 4;
    [dispMyRecord addTarget:self
                     action:@selector(buttonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dispMyRecord];
    
    
    //右
    dispWorldRecord = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    dispWorldRecord.frame = CGRectMake(initXButton + (double)widthButton*2.0f/3.0f,
                                       initYButton + (heightButton + intervalButton) * 4,
                                     widthButton/3, heightButton);
    dispWorldRecord.style = HTPressableButtonStyleRounded;
    dispWorldRecord.buttonColor = [UIColor bitterSweetColor];
    dispWorldRecord.shadowColor = [UIColor bitterSweetDarkColor];
    [dispWorldRecord setTitle:@"WorldRec" forState:UIControlStateNormal];
    dispWorldRecord.tag = 5;
    [dispWorldRecord addTarget:self
                      action:@selector(buttonPressed:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dispWorldRecord];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)buttonPressed:(id)sender{
    
//    if(((UIView*)sender).tag == 0){
    
    SHStartViewController *nextVC = [[SHStartViewController alloc]init];
    nextVC.backgroundColor = ((HTPressableButton *)sender).buttonColor;
    switch (((UIView*)sender).tag) {
        case 0:{
//            nextVC = [[SHStartViewController alloc]init];
            
            nextVC.nextGameType = 0;
    //        [self presentViewController:startVC animated:NO completion:nil];
            break;
        }
        case 1:{
//            nextVC = [[SHSumViewController alloc]init];
//            nextVC = [[SHStartViewController alloc]init];
            nextVC.nextGameType = 1;
            break;
        }
            
        case 2:{
//            nextVC = [[SHSpeedViewController alloc]init];
//            nextVC = [[SHStartViewController alloc]init];
            nextVC.nextGameType = 2;
            break;
        }
            
        case 3:{
//            nextVC = [[SHStartViewController alloc]init];
            nextVC.nextGameType = 3;
            break;
        }
        default:{
            NSLog(@"意図しないボタンが検出されました。");
            return;
        }
    }
    
    
    [self.navigationController pushViewController:nextVC animated:NO];
    
}

@end
