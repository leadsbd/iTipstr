//
//  LatestVideosTVC.h
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VimeoHttpClient.h"

@interface LatestVideosTVC : UITableViewController<VimeoHttpClientDelegate>

@property(strong,nonatomic) NSArray *videoItems;

@end
