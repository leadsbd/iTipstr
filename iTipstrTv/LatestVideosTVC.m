//
//  LatestVideosTVC.m
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "LatestVideosTVC.h"
#import "VimeoHttpClient.h"
#import "StreamingVC.h"
#import "AFImageRequestOperation.h"

@interface LatestVideosTVC ()

@end

@implementation LatestVideosTVC
@synthesize videoItems;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 //   barButton = nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom methods

-(NSString *) getTime:(NSString *)seconds
{
    int sec = [seconds intValue];
    NSString *strTime;
    if(sec<60)
    {
       strTime = [NSString stringWithFormat:@"00:%i",sec];
    }
    else
    {
        int vagfol = (int)sec/60;
        int vagshes = sec%60;
        
        strTime = [NSString stringWithFormat:@"%i:%i",vagfol,vagshes];
    }
    
    return strTime;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of section.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.videoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *videoDict = [self.videoItems objectAtIndex:indexPath.row];
    //image view
    NSString *imageUrl = [videoDict objectForKey:@"thumbnail_large"];
    UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:100];
   // imageView.image = [self getImage:imageUrl];
    //Store this image on the same server as the weather canned files
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:request
                                                                              imageProcessingBlock:nil
                                                                                           success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                                                                               imageView.image = image;
//                                                                                               [self saveImage:image withFilename:@"background.png"];
                                                                                           }
                                                                                           failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                                                               NSLog(@"Error %@",error);
                                                                                           }];
    [operation start];
    //Title Label
    UILabel *labelTitle = (UILabel*)[cell.contentView viewWithTag:101];
    labelTitle.text = [videoDict objectForKey:@"title"];
    
    //Time label
    UILabel *labelDuration = (UILabel*)[cell.contentView viewWithTag:102];
    labelDuration.text=[self getTime:[videoDict objectForKey:@"duration"]];
    
    return cell;
}

 

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *videoDict=[self.videoItems objectAtIndex:indexPath.row];
    
    [self.delegate didSentSelectedVideoTo:self with:videoDict];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - VimeoHttpClientDelegate methods
//-(void)vimeoHttpClient:(VimeoHttpClient *)client didUpdateWithData:(id)data
//{
//    self.videoItems = data;
//    self.title = @"Latest Videos";
//    [self.tableView reloadData];
//    
//   // NSLog(@"data inside tvc: %@",self.videoItems);
//}
//-(void)vimeoHttpClient:(VimeoHttpClient *)client didFailWithError:(NSError *)error
//{
//    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Videos"
//                                                 message:[NSString stringWithFormat:@"%@",error]
//                                                delegate:nil
//                                       cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [av show];
//    
//}


#pragma mark - segue method
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    StreamingVC *svc = segue.destinationViewController;
    svc.selectedDict = [self.videoItems objectAtIndex:indexPath.row];
    
}

 

- (IBAction)cancelModalView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
