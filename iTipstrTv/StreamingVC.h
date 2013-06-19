//
//  StreamingVC.h
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ParentViewController.h"
#import "VimeoHttpClient.h"
#import "LatestVideosTVC.h"

@interface StreamingVC : ParentViewController<VimeoHttpClientDelegate,LatestVideosTVCDelegate>

@property(nonatomic,strong) NSDictionary *selectedDict;
@property(nonatomic,strong) NSArray *videoArray;
@property(nonatomic,strong) NSDictionary *videoDict;

@property(nonatomic,strong) UIImage *myImage;

@property (weak, nonatomic) IBOutlet UIWebView *videoWebView;
- (IBAction)shareButton:(id)sender;

@end
