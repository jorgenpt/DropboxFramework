//
//  DBTest.m
//  DropboxFramework
//
//  Created by Jørgen P. Tjernø on 1/16/11.
//  Copyright 2011 devSoft. All rights reserved.
//

#import "DBTest.h"

#import "DBLoginController.h"
#import "DBSession.h"

@implementation DBTest

@synthesize window;
@synthesize linkButton;
@synthesize loginController;

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
}


- (void) awakeFromNib
{
    // Set these variables before launching the app
    NSString *consumerKey = @"<YOUR CONSUMER KEY>";
	NSString *consumerSecret = @"<YOUR CONSUMER SECRET>";
    
	DBSession *session =  [[DBSession alloc] initWithConsumerKey:consumerKey
                                                  consumerSecret:consumerSecret];
	[session setDelegate:self];
	[DBSession setSharedSession:session];
    [session release];
    
    [self updateLinkTitle];
}

- (IBAction) link:(id)sender
{
    if ([[DBSession sharedSession] isLinked])
    {
        [[DBSession sharedSession] unlink];
        [self updateLinkTitle];
    }
    else
    {
        [linkButton setEnabled:NO];
        [self setLoginController:[[[DBLoginController alloc] init] autorelease]];
        [loginController setDelegate:self];
        [loginController presentFrom:window];
    }
}

- (void) updateLinkTitle
{
    if ([[DBSession sharedSession] isLinked])
    {
        [linkButton setTitle:NSLocalizedString(@"Unlink", @"Title for button to unlink your Dropbox account")];
    }
    else
    {
        [linkButton setTitle:NSLocalizedString(@"Link", @"Title for button to link your Dropbox account")];
    }    
}

#pragma mark Delegate methods

- (void) sessionDidReceiveAuthorizationFailure:(DBSession *)session
{
    [self updateLinkTitle];
    [self link:nil];
}

- (void) controllerDidComplete:(DBLoginController *)window
{
    [self setLoginController:nil];
    [linkButton setEnabled:YES];
    [self updateLinkTitle];
}

- (void) controllerDidCancel:(DBLoginController *)window
{
    [self setLoginController:nil];
    [linkButton setEnabled:YES];
}

@end

int main(int argc, const char *argv[])
{
    return NSApplicationMain(argc,  argv);
}
