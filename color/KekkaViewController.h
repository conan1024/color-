//
//  KekkaViewController.h
//  color
//
//  Created by Masanari Miyamoto on 2014/11/22.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;
@interface KekkaViewController : UIViewController
{
    GADInterstitial *interstitial_;
    int number;
    IBOutlet UILabel *label;
}



@end
