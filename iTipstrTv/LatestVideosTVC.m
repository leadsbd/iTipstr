//
//  LatestVideosTVC.m
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import "LatestVideosTVC.h"
#import "VimeoHttpClient.h"

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
    VimeoHttpClient *vimeoHttpClient =[VimeoHttpClient sharedVimeoHttpClient];
    vimeoHttpClient.delegate = self;
    
    [vimeoHttpClient collectDataFromVimeoServer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.textLabel.text = [videoDict objectForKey:@"title"];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


#pragma mark - VimeoHttpClientDelegate methods
-(void)vimeoHttpClient:(VimeoHttpClient *)client didUpdateWithData:(id)data
{
    self.videoItems = data;
    self.title = @"Latest Videos";
    [self.tableView reloadData];
    
    NSLog(@"data inside tvc: %@",self.videoItems);
}
-(void)vimeoHttpClient:(VimeoHttpClient *)client didFailWithError:(NSError *)error
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Videos"
                                                 message:[NSString stringWithFormat:@"%@",error]
                                                delegate:nil
                                       cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
    
}



@end
