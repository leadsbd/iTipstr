//
//  SoundVisionsAlbumVC.m
//  iTipstrTv
//
//  Created by LEADS on 6/18/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import "SoundVisionsAlbumVC.h"

@interface SoundVisionsAlbumVC ()

@end

@implementation SoundVisionsAlbumVC

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
    
    // Setting Up Activity Indicator View
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicatorView.hidesWhenStopped = YES;
    self.activityIndicatorView.center = self.view.center;
    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    
    NSString *urlString = @"http://www.tipstr.tv/sound-visions-album/";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myTipstrWebView loadRequest:request];
    
    
    
    [self.activityIndicatorView stopAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
