//
//  ViewController.h
//  color
//
//  Created by Masanari Miyamoto on 2014/11/15.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    IBOutlet UIView *redView, *blueView;
    
    IBOutlet UILabel *resultLabel;
    
    UIView *blackView;
    UIView *redsmallView;
    UIView *bluesmallView;
    
    int number;
    int score;
    IBOutlet UILabel *scorelabel;
}

-(void)panAction:(UIPanGestureRecognizer *)sender;
-(void)panAction2:(UIPanGestureRecognizer *)sender;

-(void)makered;
-(void)makeblue;
-(void)random;
-(void)plusScore;


@end

