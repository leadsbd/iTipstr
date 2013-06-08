//
//  StreamingVC.m
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import "StreamingVC.h"

@interface StreamingVC ()

@end

@implementation StreamingVC
@synthesize selectedDict;

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
//	NSString *urlStr = selectedDict[@"mobile_url"];
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSLog(@"sUrl: %@",url);
    
    //dummy url
  //  NSURL *urlDummy = [NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"];
    
  //  NSLog(@"pathExtension: %@",[urlDummy pathExtension]);
    
//    _player = [[MPMoviePlayerController alloc] initWithContentURL:urlDummy];
//    
//    
//    [[NSNotificationCenter defaultCenter]
//     addObserver:self
//     selector:@selector(movieFinishedCallback:)
//     name:MPMoviePlayerPlaybackDidFinishNotification
//     object:_player];
//    
//    
//    _player.view.frame = CGRectMake(0, 0, 320, 350);
//    [self.view addSubview:_player.view];
//    
//    //--play movie
//    [_player play];
    
//    NSURLRequest *reqObj = [NSURLRequest requestWithURL:url];
//    [self.videoWebView loadRequest:reqObj];
    
    NSString *videoID = selectedDict[@"id"];
    NSString *urlAddress = [NSString stringWithFormat:@"http://player.vimeo.com/video/%@",videoID];
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.videoWebView loadRequest:requestObj];
    
    
}

//-- called when the movie is done playing--
-(void)movieFinishedCallback:(NSNotification*) aNotification
{
    MPMoviePlayerController *moviePlayer = [aNotification object];
    
    [[NSNotificationCenter defaultCenter]
    removeObserver:self
    name:MPMoviePlayerPlaybackDidFinishNotification
     object:moviePlayer];
    
    [moviePlayer.view removeFromSuperview];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
