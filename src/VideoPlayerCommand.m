//
//  ActivityIndicatorCommand.m
//  HelloPhoneGap
//
//  Created by Hiedi Utley on 4/8/11.
//  Copyright 2011 Chariot Solutions, LLC. All rights reserved.
//

#import "VideoPlayerCommand.h"
#import "MediaPlayer/MPMoviePlayerViewController.h"
#import "MediaPlayer/MPMoviePlayerController.h"
#import <Cordova/CDVViewController.h>
#import "MovieViewController.h"

@implementation VideoPlayerCommand

- (void)show:(CDVInvokedUrlCommand*)command {
    NSString *movie = [command.arguments objectAtIndex:0];
    NSString *orient = [command.arguments objectAtIndex:1];
    NSRange range = [movie rangeOfString:@"http"];
    if(range.length > 0) {
        if ([@"YES" isEqualToString:orient]) {
            player = [[MovieViewController alloc] initWithContentURL:[NSURL URLWithString:movie] andOrientation:YES];
        } else {
            player = [[MovieViewController alloc] initWithContentURL:[NSURL URLWithString:movie] andOrientation:NO];
        }
         
    } else {
        NSArray *fileNameArr = [movie componentsSeparatedByString:@"."];
        NSString *prefix = [fileNameArr objectAtIndex:0];
        NSString *suffix = [fileNameArr objectAtIndex:1];
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:prefix ofType:suffix];
        NSURL *fileURL = [NSURL fileURLWithPath:soundFilePath];
        if ([@"YES" isEqualToString:orient]) {
            player = [[MovieViewController alloc] initWithContentURL:fileURL andOrientation:YES];
        } else {
            player = [[MovieViewController alloc] initWithContentURL:fileURL andOrientation:NO]; 
        }        
    }
    if (player) {
        CDVViewController *cont = (CDVViewController *) self.viewController;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MovieDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
        [cont presentMoviePlayerViewControllerAnimated:player];
    }
}

- (void)MovieDidFinish:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    [self writeJavascript:@"videoplayerCallBack('finish');"];

}

- (void)dealloc {
//    [player release];
//    [super dealloc];
}


@end
