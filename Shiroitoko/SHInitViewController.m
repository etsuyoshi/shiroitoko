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
int initYButton = 170;
int intervalButton = 20;

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    HTPressableButton *game10sec = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    game10sec.frame = CGRectMake(initXButton, initYButton, widthButton, heightButton);
    game10sec.style = HTPressableButtonStyleRounded;
    [game10sec setTitle:@"10seconds" forState:UIControlStateNormal];
    game10sec.tag = 0;
    [game10sec addTarget:self
                          action:@selector(buttonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:game10sec];
    
    
    HTPressableButton *gameSummation = [HTPressableButton buttonWithType:UIButtonTypeCustom];
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
    
    
    
    HTPressableButton *gameSpeed = [HTPressableButton buttonWithType:UIButtonTypeCustom];
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
    
    
    
    
    HTPressableButton *dispRecord = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    dispRecord.frame = CGRectMake(initXButton, initYButton + (heightButton + intervalButton) * 3,
                                     widthButton, heightButton);
    dispRecord.style = HTPressableButtonStyleRounded;
    dispRecord.buttonColor = [UIColor emeraldColor];
    dispRecord.shadowColor = [UIColor nephritisColor];
    [dispRecord setTitle:@"Record" forState:UIControlStateNormal];
    dispRecord.tag = 3;
    [dispRecord addTarget:self
                      action:@selector(buttonPressed:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dispRecord];
    
    
    
    
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
    
    UIViewController *nextVC;
    switch (((UIView*)sender).tag) {
        case 0:{
            nextVC = [[SHStartViewController alloc]init];
    //        [self presentViewController:startVC animated:NO completion:nil];
            break;
        }
        case 1:{
            nextVC = [[SHStartViewController alloc]init];
            break;
        }
            
        case 2:{
            nextVC = [[SHStartViewController alloc]init];
            break;
        }
            
        case 3:{
            nextVC = [[SHStartViewController alloc]init];
            break;
        }
        default:{
            return;
        }
    }
    
    
    [self.navigationController pushViewController:nextVC animated:NO];
    
}

@end
