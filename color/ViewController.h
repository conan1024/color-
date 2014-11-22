//
//  ViewController.h
//  color
//
//  Created by Masanari Miyamoto on 2014/11/15.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    IBOutlet UIView *redView, *blueView, *greenView, *yellowView;
    
    IBOutlet UILabel *resultLabel;
    NSTimer *timer; //クイズ中の経過時間を生成する
    int countDown;  //設定時間
    IBOutlet UILabel *timerlabel;
    
    UIView *blackView;
    UIView *redsmallView;
    UIView *bluesmallView;
    UIView *greensmallView;
    UIView *yellowsmallView;
    
    int number;
    int score;
    IBOutlet UILabel *scorelabel;
}

-(void)panAction:(UIPanGestureRecognizer *)sender;
-(void)panAction2:(UIPanGestureRecognizer *)sender;
-(void)panAction3:(UIPanGestureRecognizer *)sender;
-(void)panAction4:(UIPanGestureRecognizer *)sender;
-(void)panAction5:(UIPanGestureRecognizer *)sender;


-(void)makered;
-(void)makeblue;
-(void)makegreen;
-(void)makeyellow;
-(void)random;
-(void)plusScore;



@end

