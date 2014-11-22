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
    // Do any additional setup after loading the view, typically from a nib.
    
    [self random];



//    blackView = [[UIView alloc]initWithFrame:CGRectMake(135,400,50,50)];
//    
//    blackView.backgroundColor = [UIColor blackColor];
//    
//    [self.view addSubview:blackView];
//    
//    UIPanGestureRecognizer *pan =
//    [[UIPanGestureRecognizer alloc] initWithTarget:self
//                                            action:@selector(panAction:)];
//    
//    [blackView addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)random{
    number=arc4random()%2;
    
    NSLog(@"%d",number);
    switch (number) {
        case 0:
            [self makered];
            break;
        case 1:
            [self makeblue];
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
    
    UIPanGestureRecognizer *pan3 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction3:)];
    
    [redsmallView addGestureRecognizer:pan3];
}

-(void)makeblue{
    NSLog(@"make:blue");
    bluesmallView = [[UIView alloc] initWithFrame:CGRectMake(135,400,50,50)];
    
    bluesmallView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:bluesmallView];
    
    UIPanGestureRecognizer *pan2 =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panAction2:)];
    
    [bluesmallView addGestureRecognizer:pan2];

}

-(void)plusScore{
    NSLog(@"add score");
    score = score + 100;
    scorelabel.text = [NSString stringWithFormat:@"%d",score];
}

-(void)panAction3:(UIPanGestureRecognizer *)sender
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
        }
    }
}

- (void)panAction2:(UIPanGestureRecognizer *)sender
{
    CGPoint p = [sender translationInView:self.view];
    
    CGPoint movedPoint = CGPointMake(bluesmallView.center.x + p.x, bluesmallView.center.y + p.y);
    
    bluesmallView.center = movedPoint;
    
    //NSLog(@"⭐︎座標%@を移動中...⭐︎", NSStringFromCGPoint(movedPoint));
    
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
            NSLog(@"青:赤と重なりました！");
            [bluesmallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
        }
    }
}



@end
