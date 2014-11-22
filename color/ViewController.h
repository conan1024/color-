//
//  ViewController.h
//  color
//
//  Created by Masanari Miyamoto on 2014/11/15.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    IBOutlet UIView *redView, *blueView, *greenView, *yelloView
    
    IBOutlet UILabel *resultLabel;
    
    UIView *blackView;
    UIView *redsmallView;
    UIView *bluesmallView;
    UIView *greensmallView;
    UIView *yellosmallView;
    
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
-(void)makeyello;
-(void)random;
-(void)plusScore;


@end

