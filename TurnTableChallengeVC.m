//
//  TurnTableChallengeVC.m
//  iTipstrTv
//
//  Created by LEADS on 6/18/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import "TurnTableChallengeVC.h"

@interface TurnTableChallengeVC ()

@end

@implementation TurnTableChallengeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *urlString = @"http://www.tipstr.tv/dj/";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myTipstrWebView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
