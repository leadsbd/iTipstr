//
//  VimeoHttpClient.m
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import "VimeoHttpClient.h"
#import "AFJSONRequestOperation.h"

@implementation VimeoHttpClient

+(VimeoHttpClient *) sharedVimeoHttpClient
{
    NSString *urlStr = @"http://vimeo.com/api/v2/2479238/videos.json";
    
    static dispatch_once_t pred;
    static VimeoHttpClient *_vimeoHttpClient = nil;
    
    dispatch_once(&pred, ^{ _vimeoHttpClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:urlStr]]; });
    return _vimeoHttpClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

-(void) collectDataFromVimeoServer
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    
    [self getPath:@"videos.json"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"Data:%@", responseObject);
         
         if([self.delegate respondsToSelector:@selector(vimeoHttpClient:didUpdateWithData:)])
             [self.delegate vimeoHttpClient:self didUpdateWithData:responseObject];
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if([self.delegate respondsToSelector:@selector(vimeoHttpClient:didFailWithError:)])
             [self.delegate vimeoHttpClient:self didFailWithError:error];
     }];
}

@end
