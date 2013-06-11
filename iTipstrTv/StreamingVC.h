//
//  StreamingVC.h
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface StreamingVC : UIViewController

@property(nonatomic,strong) NSDictionary *selectedDict;
@property(nonatomic,strong) MPMoviePlayerController *player;
@property (weak, nonatomic) IBOutlet UIWebView *videoWebView;
- (IBAction)shareButton:(id)sender;

@end
