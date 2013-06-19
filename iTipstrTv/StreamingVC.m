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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    VimeoHttpClient *vimeoHttpClient =[VimeoHttpClient sharedVimeoHttpClient];
    vimeoHttpClient.delegate = self;
    
    [vimeoHttpClient collectDataFromVimeoServer];
    
  //  [self displayVideo];
    
    
}

//-- called when the movie is done playing--

- (IBAction)shareButton:(id)sender {
    
    NSString *imageUrl = [selectedDict objectForKey:@"thumbnail_medium"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:request
                                                                              imageProcessingBlock:nil
                                                                                           success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                                                                              myImage = image;
                                                                                              
                                                                                               NSString *urlString = [selectedDict objectForKey:@"url"];
                                                                                               NSURL *url1 = [NSURL URLWithString:urlString];
                                                                                    
                                                                                               NSArray *activityItems = @[url1];
                                                                                    
                                                                                               
                                                                                               UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
                                                                                               [self presentViewController:vc animated:YES completion:nil];
                                                                                           }
                                                                                           failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                                                               NSLog(@"Error %@",error);
                                                                                           }];
    [operation start];
    
       
    NSLog(@"Hello \n Hello\n");
    
    
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
    LatestVideosTVC *latestTVC = segue.destinationViewController;
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
