//
//  SHViewController.m
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import "SHStandardViewController.h"

@interface SHStandardViewController ()

@end

@implementation SHStandardViewController
NSTimer *timer;
NSMutableArray *arrTile;
UILabel *labelHitCounter;
UILabel *labelTimer;
BOOL isGame;

int hitCounter;
int timeCounter;

int widthTile;
int heightTile;
int widthLine;


int totalColumnNum;//列数
int totalRowNum;//行数


int hitNumber;//あたり番号


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //statusbarを隠す
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    
    
    
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithTitle:@"Back"
     style:UIBarButtonItemStyleDone
     target:self action:@selector(pressedBarBackButton:)];
    self.navigationItem.hidesBackButton = YES;
    
    
    labelHitCounter = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 150, 20)];
    labelHitCounter.text = @"0";
    labelHitCounter.textAlignment = NSTextAlignmentLeft;
    labelHitCounter.font = [UIFont systemFontOfSize:25];
    labelHitCounter.textColor = [UIColor redColor];
    labelHitCounter.backgroundColor = [UIColor clearColor];
    labelHitCounter.center = CGPointMake(labelHitCounter.bounds.size.width/2,
                                         55);
    
    
    labelTimer = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 150, 20)];
    labelTimer.text = @"00:00";//x.x秒数
    labelTimer.textAlignment = NSTextAlignmentRight;
    labelTimer.font = [UIFont systemFontOfSize:25];
    labelTimer.textColor = [UIColor redColor];
    labelTimer.backgroundColor = [UIColor clearColor];
    labelTimer.center = CGPointMake(self.view.bounds.size.width-labelTimer.bounds.size.width/2,
                                    55);
    
    
    
    
    self.view.backgroundColor = [UIColor blackColor];
    arrTile = [NSMutableArray array];
    
    int x0 = 0;
    int y0 = 0;
    
    
    totalColumnNum = 4;
    totalRowNum = 4;
    
    
    widthLine = 3;//px
    widthTile = self.view.bounds.size.width/4-widthLine;
    heightTile = self.view.bounds.size.height/4-widthLine;
    
    NSMutableArray *arrTmpTile = [NSMutableArray array];
    BOOL isAlreadyOn = false;//既にオフのブロックがないか(一列の中でどれかはオンにならなければならない)
    for(int j = 0;j < totalRowNum;j++){
        arrTmpTile = [NSMutableArray array];
        isAlreadyOn = NO;
        for(int i = 0; i < totalColumnNum;i ++){
            x0 = i * (widthTile + widthLine);
            y0 = j * (heightTile + widthLine);
            SHTile *myTile = [[SHTile alloc]initWithFrame:CGRectMake(x0, y0, widthTile, heightTile)];
            myTile.tag = [[NSString stringWithFormat:@"%d%d", j,i] intValue];//j行i列をjiとタグ付けする
//            UITapGestureRecognizer *gesture =
//            [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//            [myTile addGestureRecognizer:gesture];
            if(arc4random() % (totalColumnNum-1) == 0 && !isAlreadyOn){
                [myTile changeColor];
                isAlreadyOn = YES;
                NSLog(@"%d列目の%d行目がオン", j,i);
            }else if(i == totalColumnNum - 1 && !isAlreadyOn){
                [myTile changeColor];
                isAlreadyOn = YES;//あまり意味ないけど
                NSLog(@"%d列目の%d行目がオン", j,i);
            }
            [arrTmpTile addObject:myTile];
        }
        
        [arrTile addObject:arrTmpTile];
    }
    
    
    
//    NSTimer *tm = [[NSTimer alloc]init];
    
    timer = [NSTimer
             scheduledTimerWithTimeInterval:0.01f
             target:self
             selector:@selector(time:)//タイマー呼び出し
             userInfo:nil
             repeats:YES];
    
    isGame = true;
    
    
    [self initialization];
    
}

-(void)initialization{
    labelHitCounter.text = @"0";
    labelTimer.text = @"00:00";
    
    hitCounter = 0;
    timeCounter = 0;
    hitCounter = 0;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    for(int j = 0;j < [arrTile count];j++){
        for(int i = 0 ; i < [arrTile[j] count];i++){
            if(j == 2){
                if(((SHTile *)arrTile[j][i]).isOn){
                    hitNumber = i;
                }
            }
            [self.view addSubview:((SHTile *)arrTile[j][i])];
            NSLog(@"view[%d][%d] = %@", j,i,((SHTile *)arrTile[j][i]));
        }
    }
    
    
    //タップ用ビュー
    for(int i =0;i < totalColumnNum;i++){
        CGRect rectTmp = CGRectMake(i * (widthTile + widthLine), 200, widthTile + widthLine, heightTile*2);
//        UIView *viewForTap = [[UIView alloc]initWithFrame:rectTmp];
        SHTouchPanel *viewForTap = [[SHTouchPanel alloc]initWithFrame:rectTmp];
        viewForTap.delegate = self;
        viewForTap.backgroundColor = [UIColor clearColor];
//        viewForTap.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];//将来的にはclearColor
//        viewForTap.backgroundColor = [UIColor colorWithRed:((double)i)/totalColumnNum green:1 blue:1 alpha:0.3f];
        viewForTap.tag = i;
        
        //touchesbegan:withEventで対応するのでgesture不要
//        UITapGestureRecognizer *gesture =
//        [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];//touch-downアクション対応にする
//        [viewForTap addGestureRecognizer:gesture];
        [self.view addSubview:viewForTap];
    }
    
    
    
    
    [self.view addSubview:labelHitCounter];
    [self.view addSubview:labelTimer];
}

//-(void)tapAction:(id)sender{
//    NSLog(@"sender = %@, tag=%d",sender,((UIGestureRecognizer *)sender).view.tag);
//    UIView *tappedView = ((UIGestureRecognizer *)sender).view;
//    NSLog(@"現在のヒットは%d, 押されたのは%d",hitNumber,tappedView.tag);
//    if(tappedView){
//        if(tappedView.tag < [arrTile[2] count]){
//            if(((SHTile *)arrTile[2][tappedView.tag]).isOn){//既にhitNumberに入っているのでhitNumber == tappedView.tagで判定すればおk
//                NSLog(@"あたり");
//                hitCounter++;
//                [self proceed];
//            }else{
//                NSLog(@"はずれ");
//                isGame = false;
//                [self hazure:tappedView.tag];
//            }
//        }
//        
//    }
//    
//    
//}

-(void)proceed{
    
//    hitCounterをラベルに更新する
    labelHitCounter.text = [NSString stringWithFormat:@"%d",hitCounter];
    //最上段以外は上段のタイルをそのまま受け継ぐ(常に上段のステータスを確認するので下から更新していく)
    for(int j = totalRowNum - 1;j >= 1;j--){//0行目以外
//        NSLog(@"j=%d", j);
        for(int i = 0;i < totalColumnNum;i++){
            [((SHTile *)arrTile[j][i]) resetColor];
            if(((SHTile *)arrTile[j-1][i]).isOn){//上段のステータスを確認
                
                if(!((SHTile *)arrTile[j][i]).isOn){//現在のタイルがオフなら
                    //当該タイルの状態を更新する
                    [((SHTile *)arrTile[j][i]) changeColor];
                }
                
                if(j == 2){//タップ判定のためのタイル
                    //hitNumberの更新
                    hitNumber = i;
                    
//                    NSLog(@"次のヒットは%d", hitNumber);
                }
            }
        }
    }
    
    
    BOOL isAlreadyOn = false;
    //最上段(０列目)のみランダムに配置
    for(int i = 0;i < totalColumnNum;i++){
        [((SHTile *)arrTile[0][i]) resetColor];
        if(arc4random() % (totalColumnNum-1) == 0 && !isAlreadyOn){
            [((SHTile *)arrTile[0][i]) changeColor];
            isAlreadyOn = YES;
            NSLog(@"%d列目の%d行目がオン", 0,i);
        }else if(i == totalColumnNum - 1 && !isAlreadyOn){
            [((SHTile *)arrTile[0][i]) changeColor];
            isAlreadyOn = YES;//あまり意味ないけど
            NSLog(@"%d列目の%d行目がオン", 0,i);
        }
    }
    
}

-(void)hazure:(int)num{
    NSLog(@"%dが押されたので終了します", num);
    CGRect originalFrame = ((SHTile *)arrTile[totalColumnNum - 2][num]).frame;
    UIColor *originalColor = ((SHTile *)arrTile[totalColumnNum - 2][num]).backgroundColor;
    
    ((SHTile *)arrTile[totalColumnNum - 2][num]).backgroundColor =
    [UIColor whiteColor];
    
    [self.view bringSubviewToFront:((SHTile *)arrTile[totalColumnNum - 2][num])];
    [UIView animateWithDuration:0.5f
                     animations:^{
                         ((SHTile *)arrTile[totalColumnNum - 2][num]).frame =
                         CGRectMake(originalFrame.origin.x-40,
                                    originalFrame.origin.y-40,
                                    originalFrame.size.width+80,
                                    originalFrame.size.height+80);
                         
                         ((SHTile *)arrTile[totalColumnNum - 2][num]).backgroundColor =
                         [UIColor whiteColor];

                     }
                     completion:^(BOOL finished){
                         if(finished){
                             [UIView animateWithDuration:0.5f
                                              animations:^{
                                                  ((SHTile *)arrTile[totalColumnNum - 2][num]).frame =
                                                  originalFrame;
                                                  
                                                  ((SHTile *)arrTile[totalColumnNum - 2][num]).backgroundColor =
                                                  originalColor;

                                              }
                                              completion:^(BOOL finished2){
                                                  
                                                  if(finished2){
                                                      NSLog(@"game over calling...");
                                                      [self gameOver];
                                                  }
                                              }];
                         }
                     }];
}

-(void)gameOver{
    NSLog(@"game over");
    UILabel *label = [[UILabel alloc]initWithFrame:
    CGRectMake(0, 0, self.view.bounds.size.width-50, 300)];
    
    label.text = @"GAME OVER!";
    label.font = [UIFont systemFontOfSize:40];
    
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor clearColor];
    
    label.center = CGPointMake(self.view.bounds.size.width/2,
                               self.view.bounds.size.height/4);
    
    [self.view addSubview:label];
    
    
    
    
    isGame = false;
    
    
    
    
    
    
    
}

-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            //１番目のボタンが押されたときの処理を記述する
            [self.navigationController popToRootViewControllerAnimated:YES];
            NSLog(@"「最初から」が選択されました");
            break;
        case 1:
            //２番目のボタンが押されたときの処理を記述する
            [self.navigationController popViewControllerAnimated:YES];
            NSLog(@"「戻る」ボタンが押されました");
            break;
    }
    
}


- (void)time:(NSTimer*)timer{
    //0.01秒ごとに呼ばれる
    
    if(isGame){
        if(timeCounter < 1000){
            timeCounter ++;
            labelTimer.text = [NSString stringWithFormat:@"%.2f", (double)timeCounter/100.0f];
        }else{
            NSLog(@"timer is over 10000 so game over!");
            [self gameOver];
        }
    }else{
        
        UIAlertView *alert =
        [[UIAlertView alloc]
         initWithTitle:@"メニューを選んで下さい"
         message:nil
         delegate:self
         cancelButtonTitle:@"メニューに戻る"
         otherButtonTitles:@"もう一回", nil
         ];
        [alert show];
        
        
        //timer停止
        [timer invalidate];
        //

        
    }
    
    
}

//statusbarを隠す
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


-(void)pressedBarBackButton:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    [self initialization];
    [timer invalidate];
}



/* TouchesDelegate */

- (void)view:(UIView*)view touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	NSLog(@"delegate touchesBegan");
    
    NSLog(@"sender = %@, tag=%d",view,view.tag);
    UIView *tappedView = view;
    NSLog(@"現在のヒットは%d, 押されたのは%d",hitNumber,tappedView.tag);
    if(tappedView){
        if(tappedView.tag < [arrTile[2] count]){
            if(((SHTile *)arrTile[2][tappedView.tag]).isOn){//既にhitNumberに入っているのでhitNumber == tappedView.tagで判定すればおk
                NSLog(@"あたり");
                hitCounter++;
                [self proceed];
            }else{
                NSLog(@"はずれ");
                isGame = false;
                [self hazure:tappedView.tag];
            }
        }
        
    }
    
    
}

- (void)view:(UIView*)view touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
	NSLog(@"delegate touchesMoved");
}

- (void)view:(UIView*)view touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	NSLog(@"delegate touchesEnded");
}

- (void)view:(UIView*)view touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
	NSLog(@"delegate touchesCancelled");
}

@end
