//
//  ViewController.m
//  color
//
//  Created by Masanari Miyamoto on 2014/11/15.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self random];
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
    }
}

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


-(void)panAction:(UIPanGestureRecognizer *)sender
{
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(blackView.center.x + p.x, blackView.center.y + p.y);
    
    blackView.center = movedPoint;
    
    //NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"⭐︎移動終了⭐︎");
        
        if (CGRectContainsPoint(redView.frame, blackView.center))
            
        {
            resultLabel.text = @"赤と重なりました";
        }else if(CGRectContainsPoint(blueView.frame,blackView.center))
            
        {
            resultLabel.text = @"青と重なりました";
        }else{
            resultLabel.text = @"重なっていません";
        }
    }else{
        resultLabel.text = @"移動中";
    }
}

-(void)makered{
    NSLog(@"make:red");
    redsmallView = [[UIView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    
    redsmallView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redsmallView];
    
    UIPanGestureRecognizer *pan2 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction2:)];
    
    [redsmallView addGestureRecognizer:pan2];
}

-(void)makeblue{
    NSLog(@"make:blue");
    bluesmallView = [[UIView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    
    bluesmallView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:bluesmallView];
    
    UIPanGestureRecognizer *pan3 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction3:)];
    
    [bluesmallView addGestureRecognizer:pan3];
}

-(void)makegreen{
    NSLog(@"make:green");
    greensmallView = [[UIView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    
    greensmallView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:greensmallView];
    
    UIPanGestureRecognizer *pan4 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction4:)];
    
    [greensmallView addGestureRecognizer:pan4];
}

-(void)makeyellow{
    NSLog(@"make:yellow");
    yellowsmallView = [[UIView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    
    yellowsmallView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:yellowsmallView];
    
    UIPanGestureRecognizer *pan5 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction5:)];
    
    [yellowsmallView addGestureRecognizer:pan5];
}



-(void)plusScore{
    NSLog(@"add score");
    score = score + 100;
    scorelabel.text = [NSString stringWithFormat:@"%d",score];
}
//赤
-(void)panAction2:(UIPanGestureRecognizer *)sender
{
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(redsmallView.center.x + p.x, redsmallView.center.y + p.y);
    
    redsmallView.center = movedPoint;
    
    //NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(movedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        
        
        if (CGRectContainsPoint(redView.frame,redsmallView.center))
            
        {
            resultLabel.text = @"赤と重なりました";
            NSLog(@"赤:赤と重なりました！");
            [redsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
            
        }else if(CGRectContainsPoint(blueView.frame,redsmallView.center))
        {
            resultLabel.text = @"青と重なりました";
            NSLog(@"赤:青と重なりました！");
            [redsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }else if(CGRectContainsPoint(greenView.frame,redsmallView.center))
        {
            resultLabel.text = @"緑と重なりました";
            NSLog(@"赤:緑と重なりました！");
            [redsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }else if(CGRectContainsPoint(yellowView.frame,redsmallView.center))
        {
            resultLabel.text = @"黄色と重なりました";
            NSLog(@"赤:黄色と重なりました！");
            [redsmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }
    }
}

//青
- (void)panAction3:(UIPanGestureRecognizer *)sender
{
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(bluesmallView.center.x + p.x, bluesmallView.center.y + p.y);
    
    bluesmallView.center = movedPoint;
    
    //NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(mofvedPoint));
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (CGRectContainsPoint(redView.frame,bluesmallView.center))
            
        {
            resultLabel.text = @"赤と重なりました";
            NSLog(@"青:赤と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            
        }else if(CGRectContainsPoint(blueView.frame, bluesmallView.center))
        {
            resultLabel.text = @"青と重なりました";
            NSLog(@"青:青と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
        }else if(CGRectContainsPoint(greenView.frame,bluesmallView.center))
        {
            resultLabel.text = @"緑と重なりました";
            NSLog(@"青:緑と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
        }else if(CGRectContainsPoint(yellowView.frame,bluesmallView.center))
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
