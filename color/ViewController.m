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
        [ud setInteger:score forKey:@"KEY_I"];
        KekkaViewController *ViewController2 = [self.storyboard instantiateViewControllerWithIdentifier:@"Kekka"];
        [self presentViewController:ViewController2 animated:YES completion:nil];
    }
}

//点数の追加
-(void)plusScore{
    NSLog(@"add score");
    score = score + 100;
    scorelabel.text = [NSString stringWithFormat:@"%d",score];
    
}

//ramdomメソッドとは別に各々のsmallviewを生成するメソッドの呼び出し
-(void)random{
    number=arc4random()%4;
    
    NSLog(@"makesmallvalue %d",number);
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


#pragma mark - Make View

//redsmallviewを発生させる
-(void)makered{
    NSLog(@"make:red");
    redsmallView = [[UIView alloc] initWithFrame:CGRectMake(80,320,157,141)];
    //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
    int labelColorNumber=arc4random()%4;
    NSLog(@"%d",labelColorNumber);
    switch (labelColorNumber) {
        case 0:
            redsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"red1.png"]];
            break;
        case 1:
            redsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"red2.png"]];
            break;
        case 2:
            redsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"red3.png"]];
            break;
        case 3:
            redsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"red4.png"]];
            break;
    }
    
    /*redsmallView.image = [UIImage imageNamed:@"red2.png"];
     redsmallView.image = [UIImage imageNamed:@"red3.png"];
     redsmallView.image = [UIImage imageNamed:@"red4.png"];*/
    
    //redsmallView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redsmallView];
    //画面のviewに追加する
    
    UIPanGestureRecognizer *pan2 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panActionRed:)];
    [redsmallView addGestureRecognizer:pan2];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
    
}

//biuesmallviewを発生させる
-(void)makeblue{
    NSLog(@"make:blue");
    bluesmallView = [[UIView alloc] initWithFrame:CGRectMake(70,320,203,141)];
    //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
    int labelColorNumber=arc4random()%4;
    NSLog(@"blue%d",labelColorNumber);
    switch (labelColorNumber) {
        case 0:
            bluesmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue1.png"]];
            NSLog(@"make:blue1");
            break;
        case 1:
            bluesmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue2.png"]];
            NSLog(@"make:blue2");
            break;
        case 2:
            bluesmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue3.png"]];
            NSLog(@"make:blue3");
            break;
        case 3:
            bluesmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue4.png"]];
            NSLog(@"make:blue4");
            break;
    }
    
    
    //bluesmallView.backgroundColor = [UIColor blueColor];
    //色を青にする
    
    [self.view addSubview:bluesmallView];
    //画面のviewに追加している
    [self.view bringSubviewToFront:bluesmallView];
    
    UIPanGestureRecognizer *pan3 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panActionBlue:)];
    
    [bluesmallView addGestureRecognizer:pan3];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
}

//greensmallviewを発生させる
-(void)makegreen{
    NSLog(@"make:green");
    greensmallView = [[UIView alloc] initWithFrame:CGRectMake(40,320,254,142)];
    //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
    
    int labelColorNumber=arc4random()%4;
    NSLog(@"green%d",labelColorNumber);
    switch (labelColorNumber) {
        case 0:
            greensmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green1.png"]];
            NSLog(@"make:green1");
            break;
        case 1:
            greensmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green2.png"]];
            NSLog(@"make:green2");
            break;
        case 2:
            greensmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green3.png"]];
            NSLog(@"make:green3");
            break;
        case 3:
            greensmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green4.png"]];
            NSLog(@"make:green4");
            break;
    }
    
    
    
    //greensmallView.backgroundColor = [UIColor greenColor];
    //色を緑にする
    //    greensmallView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greensmallView];
    //画面のviewに追加している
    [self.view bringSubviewToFront:greensmallView];
    
    UIPanGestureRecognizer *pan4 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panActionGreen:)];
    
    [greensmallView addGestureRecognizer:pan4];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
    
}

//yellowsmallviewを発生させる
-(void)makeyellow{
    NSLog(@"make:yellow");
    yellowsmallView = [[UIView alloc] initWithFrame:CGRectMake(20,320,294,142)];
    //UIViewの生成・CGRectMakeで座標位置と大きさを指定(x座標・y座標・横幅・高さ)
    
    int labelColorNumber=arc4random()%4;
    NSLog(@"yellow%d",labelColorNumber);
    switch (labelColorNumber) {
        case 0:
            yellowsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow0.png"]];
            break;
        case 1:
            yellowsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow2.png"]];
            break;
        case 2:
            yellowsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow3.png"]];
            break;
        case 3:
            yellowsmallView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow4.png"]];
            break;
    }
    
    
    //yellowsmallView.backgroundColor = [UIColor yellowColor];
    //色を黄色にする
    [self.view addSubview:yellowsmallView];
    //画面のviewに追加している
    [self.view bringSubviewToFront:yellowsmallView];
    
    UIPanGestureRecognizer *pan5 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panActionYellow:)];
    
    [yellowsmallView addGestureRecognizer:pan5];
    //メソッドとして作る事より、様々な場所から呼び出す事が出来る
    
}


#pragma mark - Pan Action
//タッチを検出し、blackviewを移動するメソッドの設定


//赤
-(void)panActionRed:(UIPanGestureRecognizer *)sender
{
    NSLog(@"通ったYO!");
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
            
            //画面取得
            UIScreen *sc = [UIScreen mainScreen];
            
            //ステータスバー込みのサイズ
            CGRect rect = sc.bounds;
            NSLog(@"%.1f, %.1f", rect.size.width, rect.size.height);
            
            // imageviewを生成、画像読み込み
            UIImageView *ring =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redcircle.png"]];
            
            // 位置と大きさを設定
            ring.frame =  (CGRect){CGPointMake(rect.size.width/2-25, rect.size.height/2+10), CGSizeMake(50, 50)}; // {CGPoint, CGSize}
            
            
            // 最初の透明度
            ring.alpha = 0.2;
            
            // 画面に表示
            [self.view addSubview:ring];
            
            // animation
            [UIView animateWithDuration:0.8 animations:^{
                // 2倍に拡大
                ring.transform = CGAffineTransformMakeScale(2.0, 2.0);
                // 透明度を1に
                ring.alpha = 1.0;
            } completion:^(BOOL finished) {
                // imageviewを削除
                [ring removeFromSuperview];
            }];
            
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


//青
- (void)panActionBlue:(UIPanGestureRecognizer *)sender
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
            //画面取得
            UIScreen *sc = [UIScreen mainScreen];
            
            //ステータスバー込みのサイズ
            CGRect rect = sc.bounds;
            NSLog(@"%.1f, %.1f", rect.size.width, rect.size.height);
            
            // imageviewを生成、画像読み込み
            UIImageView *ring =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bluecircle.png"]];
            
            // 位置と大きさを設定
            ring.frame =  (CGRect){CGPointMake(rect.size.width/2-25, rect.size.height/2+10), CGSizeMake(50, 50)}; // {CGPoint, CGSize}
            
            
            // 最初の透明度
            ring.alpha = 0.2;
            
            // 画面に表示
            [self.view addSubview:ring];
            
            // animation
            [UIView animateWithDuration:0.8 animations:^{
                // 2倍に拡大
                ring.transform = CGAffineTransformMakeScale(2.0, 2.0);
                // 透明度を1に
                ring.alpha = 1.0;
            } completion:^(BOOL finished) {
                // imageviewを削除
                [ring removeFromSuperview];
            }];
            
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
            NSLog(@"ERROR青:黄色と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }
        
    }
}

//緑
- (void)panActionGreen:(UIPanGestureRecognizer *)sender
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
            
            //画面取得
            UIScreen *sc = [UIScreen mainScreen];
            
            //ステータスバー込みのサイズ
            CGRect rect = sc.bounds;
            NSLog(@"%.1f, %.1f", rect.size.width, rect.size.height);
            
            // imageviewを生成、画像読み込み
            UIImageView *ring =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greencircle.png"]];
            
            // 位置と大きさを設定
            ring.frame =  (CGRect){CGPointMake(rect.size.width/2-25, rect.size.height/2+10), CGSizeMake(50, 50)}; // {CGPoint, CGSize}
            
            
            // 最初の透明度
            ring.alpha = 0.2;
            
            // 画面に表示
            [self.view addSubview:ring];
            
            // animation
            [UIView animateWithDuration:0.8 animations:^{
                // 2倍に拡大
                ring.transform = CGAffineTransformMakeScale(2.0, 2.0);
                // 透明度を1に
                ring.alpha = 1.0;
            } completion:^(BOOL finished) {
                // imageviewを削除
                [ring removeFromSuperview];
            }];
            
            
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
- (void)panActionYellow:(UIPanGestureRecognizer *)sender
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
            //画面取得
            UIScreen *sc = [UIScreen mainScreen];
            
            //ステータスバー込みのサイズ
            CGRect rect = sc.bounds;
            NSLog(@"%.1f, %.1f", rect.size.width, rect.size.height);
            
            // imageviewを生成、画像読み込み
            UIImageView *ring =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yellowcircle.png"]];
            
            // 位置と大きさを設定
            ring.frame =  (CGRect){CGPointMake(rect.size.width/2-25, rect.size.height/2+10), CGSizeMake(50, 50)}; // {CGPoint, CGSize}
            
            
            // 最初の透明度
            ring.alpha = 0.2;
            
            // 画面に表示
            [self.view addSubview:ring];
            
            // animation
            [UIView animateWithDuration:0.8 animations:^{
                // 2倍に拡大
                ring.transform = CGAffineTransformMakeScale(2.0, 2.0);
                // 透明度を1に
                ring.alpha = 1.0;
            } completion:^(BOOL finished) {
                // imageviewを削除
                [ring removeFromSuperview];
            }];
            
            
            
            [yellowsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
        }
    }
}


@end
