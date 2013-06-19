//
//  OfficeTVC.h
//  iTipstrTv
//
//  Created by LEADS on 6/18/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfficeTVC : UITableViewController

- (IBAction)CancelModalView:(id)sender;

@property(nonatomic,strong) NSArray *aboutList;
@property(nonatomic,strong) NSArray *contents;

@end
