//
//  StreamingVC.m
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import "StreamingVC.h"
#import <Social/Social.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "AFImageRequestOperation.h"


@interface StreamingVC ()

@end

@implementation StreamingVC

@synthesize selectedDict;
@synthesize videoArray;
@synthesize videoDict;
@synthesize myImage;

- (void)displayVideo
{
    NSString *videoID = selectedDict[@"id"];
    NSString *urlAddress = [NSString stringWithFormat:@"http://player.vimeo.com/video/%@",videoID];
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.videoWebView loadRequest:requestObj];
    
    [self.activityIndicatorView stopAnimating];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    VimeoHttpClient *vimeoHttpClient =[VimeoHttpClient sharedVimeoHttpClient];
    vimeoHttpClient.delegate = self;
    
    [vimeoHttpClient collectDataFromVimeoServer];
    
  
    // Setting Up Activity Indicator View
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.activityIndicatorView setColor:[UIColor brownColor]];
    self.activityIndicatorView.hidesWhenStopped = YES;
    self.activityIndicatorView.center = self.view.center;
    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    
}

//-- called when the movie is done playing--

- (IBAction)shareButton:(id)sender {
    
    NSString *urlString = @"http://www.tipstr.tv/";
    NSURL *url1 = [NSURL URLWithString:urlString];
    
    NSArray *activityItems = @[url1];
    
    
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

#pragma mark - VimeoHttpClientDelegate methods
-(void)vimeoHttpClient:(VimeoHttpClient *)client didUpdateWithData:(id)data
{
    self.videoArray = data;
    self.selectedDict = [self.videoArray objectAtIndex:2];
    [self displayVideo];
    
    NSLog(@"data inside streaming vc: %@",self.videoArray);
}
-(void)vimeoHttpClient:(VimeoHttpClient *)client didFailWithError:(NSError *)error
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Videos"
                                                 message:[NSString stringWithFormat:@"%@",error]
                                                delegate:nil
                                       cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"segueVideoList"])
    {
        UINavigationController *nav = segue.destinationViewController;
        LatestVideosTVC *latestTVC = [nav.viewControllers objectAtIndex:0];
        latestTVC.videoItems = videoArray;
        
        latestTVC.delegate = self;
    }
    
    
}



#pragma mark - LatestVideosTVCDelegate methods

-(void)didSentSelectedVideoTo:(UITableViewController *)tvc with:(NSDictionary *)newVideo {
    self.selectedDict = newVideo;
    [self displayVideo];
  //  [tvc dismissViewControllerAnimated:YES completion:nil];
}


@end
