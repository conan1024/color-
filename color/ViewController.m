//
//  ViewController.m
//  color
//
//  Created by Masanari Miyamoto on 2014/11/15.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import "ViewController.h"
#import "KekkaViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
    [self random];
    //アプリ起動時(viewdidload)、ramdomメソッドを呼び出し、どちらかのviewをランダムに出現させる
    
    //カウントダウンの時間を設定
    countDown = 60;
    timer = [NSTimer
             scheduledTimerWithTimeInterval:1
             target: self
             selector:@selector(TimerAction)
             userInfo:nil
             repeats:YES];
}

-(void)TimerAction{
    if(countDown>0){
        countDown--;
        [timerlabel setText:[NSString stringWithFormat:@"%d",countDown]]; // ラベルに時間を表示
    }else{
        [timer invalidate]; // タイマーを停止する
        NSLog(@"---------タイムオーバ-----------");
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setInteger:100 forKey:@"KEY_I"]; 
        KekkaViewController *ViewController2 = [self.storyboard instantiateViewControllerWithIdentifier:@"Kekka"];
        [self presentViewController:ViewController2 animated:YES completion:nil];
    }
}

//ramdomメソッドとは別に各々のsmallviewを生成するメソッドの呼び出し
-(void)random{
    number=arc4random()%4;
    
    NSLog(@"%d",number);
    switch (number) {
        case 0:
            [self makered];
            break;
        case 1:
            [self makeblue];
            break;
        case 2:
            [self makegreen];
            break;
        case 3:
            [self makeyellow];
            break;
    }
}

-(void)random{
    number=arc4random()%4;
    
    NSLog(@"%d",number);
    switch (number) {
        case 0:
            [self "red1.png"];
            break;
        case 1:
            [self makeblue];
            break;
        case 2:
            [self makegreen];
            break;
        case 3:
            [self makeyellow];
            break;
    }
}


//タッチを検出し、blackviewを移動するメソッドの設定
-(void)panAction:(UIPanGestureRecognizer *)sender
{
    //移動した距離を取得
    CGPoint p = [sender translationInView:self.view];
    
    //移動した距離のx座標・y座標を？？
    CGPoint movedPoint = CGPointMake(blackView.center.x + p.x, blackView.center.y + p.y);
    
    blackView.center = movedPoint;
    
    //NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(movedPoint));
    
    //移動した距離の初期化をする（これがないと値が続きからになる）
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"⭐︎移動終了⭐︎");
        //ジェスチャー終了の合図
        
        if (CGRectContainsPoint(redView.frame, blackView.center))
            //redviewの位置座標とサイズ(frame)とblackviewの中心座標(center)が重なっている時
        {
            resultLabel.text = @"赤と重なりました";
        }else if(CGRectContainsPoint(blueView.frame,blackView.center))
             //blackviewの位置座標とサイズ(frame)とredviewの中心座標(center)が重なっている時
        {
            resultLabel.text = @"青と重なりました";
        }else{
            resultLabel.text = @"重なっていません";
            //判定の結果、重なっていない場合
        }
    }else{
        //ジェスチャーが始まった時の処理
        resultLabel.text = @"移動中";
    }
}

//redsmallviewを発生させる
-(void)makered{
    NSLog(@"make:red");
    redsmallView = [[UIImageView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
     redsmallView.image = [UIImage imageNamed:@"red1.png"];
     redsmallView.image = [UIImage imageNamed:@"red2.png"];
     redsmallView.image = [UIImage imageNamed:@"red3.png"];
     redsmallView.image = [UIImage imageNamed:@"red4.png"];
    
    //redsmallView.backgroundColor = [UIColor redColor];
    //色を赤にする
    [self.view addSubview:redsmallView];
    //画面のviewに追加する
    UIPanGestureRecognizer *pan2 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction2:)];
    [redsmallView addGestureRecognizer:pan2];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
}

//biuesmallviewを発生させる
-(void)makeblue{
    NSLog(@"make:blue");
    bluesmallView = [[UIImageView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
    bluesmallView.backgroundColor = [UIColor blueColor];
     //色を青にする
    
    [self.view addSubview:bluesmallView];
    //画面のviewに追加している
    
    UIPanGestureRecognizer *pan3 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction3:)];
    
    [bluesmallView addGestureRecognizer:pan3];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
}

//greensmallviewを発生させる
-(void)makegreen{
    NSLog(@"make:green");
    greensmallView = [[UIImageView alloc] initWithFrame:CGRectMake(135,400,50,50)];
     //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
    greensmallView.backgroundColor = [UIColor greenColor];
     //色を緑にする
    
    [self.view addSubview:greensmallView];
    //画面のviewに追加している
    
    UIPanGestureRecognizer *pan4 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction4:)];
    
    [greensmallView addGestureRecognizer:pan4];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
}

//yellowsmallviewを発生させる
-(void)makeyellow{
    NSLog(@"make:yellow");
    yellowsmallView = [[UIImageView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
    yellowsmallView.backgroundColor = [UIColor yellowColor];
     //色を黄色にする
    [self.view addSubview:yellowsmallView];
    //画面のviewに追加している

    UIPanGestureRecognizer *pan5 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction5:)];
    
    [yellowsmallView addGestureRecognizer:pan5];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
}


//点数の追加
-(void)plusScore{
    NSLog(@"add score");
    score = score + 100;
    scorelabel.text = [NSString stringWithFormat:@"%d",score];
}

//赤いドッラグの動き
-(void)panAction2:(UIPanGestureRecognizer *)sender
{
    CGPoint p = [sender translationInView:self.view];
    //移動した距離の取得
    
    CGPoint movedPoint = CGPointMake(redsmallView.center.x + p.x, redsmallView.center.y + p.y);
    redsmallView.center = movedPoint;
    //移動した距離のX座標、Y座標をredsmallviewの中心点に指定
    
    //NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    /*移動した距離の初期化
     これをしないと値が続きからになる*/
    
    //ジェスチャー終了
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (CGRectContainsPoint(redView.frame,redsmallView.center))
            //redviewの位置座標とサイズとredsmallviewの中心座標が重なっている時
        
        {
            resultLabel.text = @"赤と重なりました";
            NSLog(@"赤:赤と重なりました！");
            [redsmallView removeFromSuperview];
            //view同士が重なると消去される
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            //消去されると0.5病後にrandomメソッドを呼び出す
            [self plusScore];
            //点数の追加
            
        }else if(CGRectContainsPoint(blueView.frame,redsmallView.center))
            //blueviewの位置座標とサイズとredsmallviewの中心座標が重なっている時

        {
            resultLabel.text = @"青と重なりました";
            NSLog(@"赤:青と重なりました！");
            [redsmallView removeFromSuperview];
            
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            

        }else if(CGRectContainsPoint(greenView.frame,redsmallView.center))
            //greenの位置座標とサイズとredsmallviewの中心座標が重なっている時
        {
            resultLabel.text = @"緑と重なりました";
            NSLog(@"赤:緑と重なりました！");
            [redsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }else if(CGRectContainsPoint(yellowView.frame,redsmallView.center))
             //yerrowの位置座標とサイズとredsmallviewの中心座標が重なっている時
        {
            resultLabel.text = @"黄色と重なりました";
            NSLog(@"赤:黄色と重なりました！");
            [redsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }
    }
}

//青いドッラグの動き
- (void)panAction3:(UIPanGestureRecognizer *)sender
{
    CGPoint p = [sender translationInView:self.view];
    //移動した距離の取得
    
    CGPoint movedPoint = CGPointMake(bluesmallView.center.x + p.x, bluesmallView.center.y + p.y);
    bluesmallView.center = movedPoint;
    //移動した距離のX座標、Y座標をredsmallviewの中心点に指定
    
    //NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(mofvedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    /*移動した距離の初期化
     これをしないと値が続きからになる*/
    
     //ジェスチャー終了
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (CGRectContainsPoint(redView.frame,bluesmallView.center))
            //redviewの位置座標とサイズとbluesmallviewの中心座標が重なっている時
        {
            resultLabel.text = @"赤と重なりました";
            NSLog(@"青:赤と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
        }else if(CGRectContainsPoint(blueView.frame, bluesmallView.center))
            //blueviewの位置座標とサイズとbluesmallviewの中心座標が重なっている時
        {
            resultLabel.text = @"青と重なりました";
            NSLog(@"青:青と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
        }else if(CGRectContainsPoint(greenView.frame,bluesmallView.center))
             //greenviewの位置座標とサイズとbluesmallviewの中心座標が重なっている時
        {
            resultLabel.text = @"緑と重なりました";
            NSLog(@"青:緑と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }else if(CGRectContainsPoint(yellowView.frame,bluesmallView.center))
             //yellowviewの位置座標とサイズとbluesmallviewの中心座標が重なっている時
        {
            resultLabel.text = @"黄色と重なりました";
            NSLog(@"青:黄色と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }

    }
}

//緑
- (void)panAction4:(UIPanGestureRecognizer *)sender
{
    
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(greensmallView.center.x + p.x, greensmallView.center.y + p.y);
    
    greensmallView.center = movedPoint;
    
    NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (CGRectContainsPoint(redView.frame,greensmallView.center))
            
        {
            resultLabel.text = @"赤と重なりました";
            NSLog(@"緑:赤と重なりました！");
            [greensmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
        }else if(CGRectContainsPoint(blueView.frame, greensmallView.center))
        {
            resultLabel.text = @"青と重なりました";
            NSLog(@"緑:青と重なりました！");
            [greensmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
        }else if(CGRectContainsPoint(greenView.frame,greensmallView.center))
        {
            resultLabel.text = @"緑と重なりました";
            NSLog(@"緑:緑と重なりました！");
            [greensmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
        }else if(CGRectContainsPoint(yellowView.frame,greensmallView.center))
        {
            resultLabel.text = @"黄色と重なりました";
            NSLog(@"緑:黄色と重なりました！");
            [greensmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }
        
    }
}

//黄色
- (void)panAction5:(UIPanGestureRecognizer *)sender
{
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(yellowsmallView.center.x + p.x, yellowsmallView.center.y + p.y);
    
    yellowsmallView.center = movedPoint;
    
    NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (CGRectContainsPoint(redView.frame,yellowsmallView.center))
            
        {
            resultLabel.text = @"赤と重なりました";
            NSLog(@"黄色:赤と重なりました！");
            [yellowsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
        }else if(CGRectContainsPoint(blueView.frame, yellowsmallView.center))
        {
            resultLabel.text = @"青と重なりました";
            NSLog(@"黄色:青と重なりました！");
            [yellowsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
        }else if(CGRectContainsPoint(greenView.frame,yellowsmallView.center))
        {
            resultLabel.text = @"緑と重なりました";
            NSLog(@"黄色:緑と重なりました！");
            [yellowsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }else if(CGRectContainsPoint(yellowView.frame,yellowsmallView.center))
        {
            resultLabel.text = @"黄色と重なりました";
            NSLog(@"黄色:黄色と重なりました！");
            [yellowsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
        }
        
    }
}



@end
