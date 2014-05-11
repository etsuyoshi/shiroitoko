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
    
    HTPressableButton *roundedRectButton = [HTPressableButton buttonWithType:UIButtonTypeCustom];
    roundedRectButton.frame = CGRectMake(30, 230, 260, 50);
    roundedRectButton.style = HTPressableButtonStyleRounded;
    [roundedRectButton setTitle:@"Rounded" forState:UIControlStateNormal];
    roundedRectButton.tag = 0;
    [roundedRectButton addTarget:self
                          action:@selector(buttonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:roundedRectButton];
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
    
    if(((UIView*)sender).tag == 0){
        SHStartViewController *startVC =
        [[SHStartViewController alloc]init];
//        [self presentViewController:startVC animated:NO completion:nil];
        [self.navigationController pushViewController:startVC animated:NO];
    }
    
    
}

@end
