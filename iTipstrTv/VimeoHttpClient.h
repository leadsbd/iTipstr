//
//  VimeoHttpClient.h
//  iTipstrTv
//
//  Created by Leads Mobile App Team on 6/7/13.
//  Copyright (c) 2013 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol VimeoHttpClientDelegate;

@interface VimeoHttpClient : AFHTTPClient

@property(weak) id<VimeoHttpClientDelegate> delegate;

+(VimeoHttpClient *) sharedVimeoHttpClient;
-(id)initWithBaseURL:(NSURL *)url;

-(void) collectDataFromVimeoServer;

@end


@protocol VimeoHttpClientDelegate <NSObject>

-(void)vimeoHttpClient:(VimeoHttpClient *)client didUpdateWithData:(id)data;
-(void)vimeoHttpClient:(VimeoHttpClient *)client didFailWithError:(NSError *)error;

@end