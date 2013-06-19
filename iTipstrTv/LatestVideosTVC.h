//
//  LatestVideosTVC.h
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VimeoHttpClient.h"


@protocol LatestVideosTVCDelegate <NSObject>

-(void)didSentSelectedVideoTo:(UITableViewController *)tvc with:(NSDictionary *) newVideo;

@end


@interface LatestVideosTVC : UITableViewController

@property(weak) id<LatestVideosTVCDelegate> delegate;

@property(strong,nonatomic) NSArray *videoItems;

- (IBAction)cancelModalView:(id)sender;

@end
