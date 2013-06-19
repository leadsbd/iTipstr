//
//  ParentViewController.m
//  SlideMenuBoth
//
//  Created by Babul Mirdha on 6/16/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "ParentViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
@interface ParentViewController ()

@end

@implementation ParentViewController

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
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    
//    if (![self.slidingViewController.underRightViewController isKindOfClass:[RightMenuViewController class]]) {
//        self.slidingViewController.underRightViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"rightMenu"];
//    }
    
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)revealMenuLeft:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (IBAction)revealMenuRight:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECLeft];
}

@end
