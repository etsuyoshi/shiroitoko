//
//  SHStartViewController.m
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import "SHStartViewController.h"


@interface SHStartViewController ()

@end

@implementation SHStartViewController
NSTimer *timer;
int timeStarter;

UILabel *labelStarter;

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
    
    
    labelStarter = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 150, 20)];
    labelStarter.text = [NSString stringWithFormat:@"%d", timeStarter];
    labelStarter.textAlignment = NSTextAlignmentCenter;
    labelStarter.font = [UIFont systemFontOfSize:100];
    labelStarter.textColor = [UIColor redColor];
    labelStarter.backgroundColor = [UIColor clearColor];
    [labelStarter sizeToFit];
    labelStarter.center = CGPointMake(self.view.bounds.size.width/2,
                                    self.view.bounds.size.height/2);
    
    [self.view addSubview:labelStarter];
    
    
    
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


-(void)viewDidAppear:(BOOL)animated{
    
    self.view.backgroundColor = [UIColor blackColor];
    
    timeStarter = 3;
    NSLog(@"init timercounter = %d", timeStarter);
    
    
    labelStarter.text = [NSString stringWithFormat:@"%d", timeStarter];
    [labelStarter sizeToFit];
    labelStarter.center = CGPointMake(self.view.bounds.size.width/2,
                                    self.view.bounds.size.height/2);
    
    
    timer = [NSTimer
             scheduledTimerWithTimeInterval:1.0f
             target:self
             selector:@selector(time:)//タイマー呼び出し
             userInfo:nil
             repeats:YES];
}


-(void)time:(NSTimer *)timer{
    NSLog(@"timer = %d", timeStarter);
    timeStarter --;
    labelStarter.text = [NSString stringWithFormat:@"c:%d", timeStarter];
    [labelStarter sizeToFit];
    labelStarter.center = CGPointMake(self.view.bounds.size.width/2,
                                    self.view.bounds.size.height/2);
    if(timeStarter > 0){
        
        
        
        labelStarter.text = [NSString stringWithFormat:@"%d", timeStarter];
    }else if(timeStarter == 0){
        
        labelStarter.text = @"START!";
        [labelStarter sizeToFit];
        labelStarter.center = CGPointMake(self.view.bounds.size.width/2,
                                        self.view.bounds.size.height/2);
        
        
    }else{
        //TIMERを停止
        [self stopTimer];
        //
        
        SHViewController *vc = [[SHViewController alloc]init];
//        [self presentViewController:vc animated:NO completion:nil];
        [self.navigationController pushViewController:vc animated:NO];
        
    }

}

-(void)stopTimer{
    [timer invalidate];
}

@end
