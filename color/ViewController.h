//
//  ViewController.h
//  color
//
//  Created by Masanari Miyamoto on 2014/11/15.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
                                                 //上　ジェスチャー認識のデリゲート宣言
   //判定するためのview
    IBOutlet UIView *redView, *blueView, *greenView, *yellowView;
    
    //判定結果を表示するためのLabel
    IBOutlet UILabel *resultLabel;
    NSTimer *timer; //クイズ中の経過時間を生成する
    int countDown;  //設定時間
    IBOutlet UILabel *timerlabel;
    
    UIView *blackView;
    UIView *redsmallView;
    UIView *bluesmallView;
    UIView *greensmallView;
    UIView *yellowsmallView;
    
    int number;//ランダムに数字を出す
    int score;//点数を管理する
    IBOutlet UILabel *scorelabel;//点数表示label
}

-(void)makered;
-(void)makeblue;
-(void)makegreen;
-(void)makeyellow;
-(void)random;
-(void)plusScore;



@end

