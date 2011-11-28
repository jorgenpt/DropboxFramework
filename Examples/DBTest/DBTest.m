//
//  DBTest.m
//  DropboxFramework
//
//  Created by Jørgen P. Tjernø on 1/16/11.
//  Copyright 2011 devSoft. All rights reserved.
//

#import "DBTest.h"

#import "DBSession.h"

@implementation DBTest

@synthesize window;
@synthesize linkButton;

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
}


- (void) awakeFromNib
{
    /*
     * Set these variables before launching the app, you also need to update DBTest/Info.plist:
     * URL Types[0] -> URL Schemes -> db-<appKey>
     *
     * You can find your app key and app secret at https://www.dropbox.com/developers/apps under your specific app.
     */
     
    NSString *appKey = @"<YOUR APPLICATION KEY>";
	NSString *appSecret = @"<YOUR APPLICATION SECRET>";
    
	DBSession *session =  [[DBSession alloc] initWithAppKey:appKey
                                                  appSecret:appSecret
                                                       root:kDBRootDropbox];
	[session setDelegate:self];
	[DBSession setSharedSession:session];
    [session release];
    
    [self updateLinkTitle];
}

- (IBAction) link:(id)sender
{
    if ([[DBSession sharedSession] isLinked])
    {
        [[DBSession sharedSession] unlinkAll];
        [self updateLinkTitle];
    }
    else
    {
        [linkButton setEnabled:NO];
        [[DBSession sharedSession] link];
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

- (void)sessionDidReceiveAuthorizationFailure:(DBSession *)session userId:(NSString *)userId
{
    [self updateLinkTitle];
    [self link:nil];
}

@end

int main(int argc, const char *argv[])
{
    return NSApplicationMain(argc,  argv);
}
