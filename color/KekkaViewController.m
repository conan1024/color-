//
//  KekkaViewController.m
//  color
//
//  Created by Masanari Miyamoto on 2014/11/22.
//  Copyright (c) 2014年 Masanari Miyamoto. All rights reserved.
//

#import "KekkaViewController.h"
@import GoogleMobileAds;
@interface KekkaViewController ()<GADInterstitialDelegate>

@end

@implementation KekkaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
    int i = [ud integerForKey:@"KEY_I"];
    label.text =[NSString stringWithFormat:@"%d",i];
    
    interstitial_ = [[GADInterstitial alloc] init];
    interstitial_.adUnitID = @"ca-app-pub-2223393653187392/6280214860";
    interstitial_.delegate = self;
    GADRequest *request = [GADRequest request];
    [interstitial_ loadRequest:request];
}
- (void)interstitialDidReceiveAd:(GADInterstitial *)interstitial
{
    [interstitial_ presentFromRootViewController:self];
}

- (void)interstitial:(GADInterstitial *)interstitial didFailToReceiveAdWithError:(GADRequestError *)error {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
