//
//  OfficeTVC.m
//  iTipstrTv
//
//  Created by LEADS on 6/18/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import "OfficeTVC.h"
#import "OfficeDetail.h"

@interface OfficeTVC ()

@end

@implementation OfficeTVC

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
    
    self.aboutList = [NSArray arrayWithObjects:@"About Us",@"Contact",@"Partner With Us", nil];
    
    self.contents = [NSArray arrayWithObjects:@"Tipstr.TV  is part of the Cohesive. TV network. We produce and broadcast TV shows and online series. Cohesive.TV started in summer 2009 in Brooklyn`s wonderful Williamsburg as a small production company with a huge future!Our vision is to produce and broadcast creative and innovative new TV, melting together new American and European culture!We know that together we can change the broadcasting world and in doing so, we are building something immensely valuable and worthwhile.Reaching a big captive audience Tipstr.TV is also an unparalleled opportunity for new artists  worldwide to get featured.Our prime shows are:Sound Visions©, an indie music show with lots of great music videos introducing new sound and brilliant artists. There is so much talent out there and Cohesive.TV wants to broadcast all!Sound Visions is produced by Cohesive.TV. The show introduces the best new musicevery month.Chic Equipe©, a fashion documentary showing a team of Fashion investigators on different missions in the Parisian Haute Couture world. In this TV you will be following Chic Equipe as they explore the exciting world of Fashion and step by step become new hip.Tipstr Movies© online series with movie previews, movie trailers, b-rolls and lots of behind the scenes material.Here you find raw material and interviews with your favorites like Robert Downey Jr., Scarlett Johansson, Mickey Rourke, Sarah Jessica Parker, Angelina Jolie, Nicolas Cage, Adrien Brody, Alfred Molina, Steve Carell and many more. Tipstr Movies is one of the best free online shows in movie previews TV has to offer.Tipstr.TV broadcasts not only online but also distributes our free TipstRzine",@"citified (at) tipstr (dot) tv",@"Tipstr.TV strongly believes in collaboration and partnerships that benefit both parties.If you operate in the Media, Fashion, Film or Music industry you may wish to consider partnering with Tipstr.TV.Get in touch with:  citified (@) tipstr (.) tvGerne arbeiten wir mit kreativen Unternehmen aus der Presse, Musik, Lifestyle etc zusammen.Wir freuen uns von euch zu hören : citified (@) tipstr (.) tv",nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.aboutList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [self.aboutList objectAtIndex:indexPath.row];
    
    return cell;
}



- (IBAction)CancelModalView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OfficeDetail *officeDetail = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    officeDetail.officeData = [self.contents objectAtIndex:indexPath.row];
    officeDetail.text1 = [self.aboutList objectAtIndex:indexPath.row];
    
}



@end
