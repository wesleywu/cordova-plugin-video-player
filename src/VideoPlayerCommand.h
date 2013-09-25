//
//  ActivityIndicatorCommand.h
//  HelloPhoneGap
//
//  Created by Hiedi Utley on 4/8/11.
//  Copyright 2011 Chariot Solutions, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Cordova/CDVPlugin.h>
//#import "MediaPlayer/MPMoviePlayerViewController.h"
#import "MovieViewController.h"

@interface VideoPlayerCommand : CDVPlugin {
    MovieViewController *player;
}

- (void)show:(CDVInvokedUrlCommand*)command;

@end
