//
//  DBTest.h
//  DropboxFramework
//
//  Created by Jørgen P. Tjernø on 1/16/11.
//  Copyright 2011 devSoft. All rights reserved.
//

#import "DBSession.h"
#import "DBLoginController.h"

@interface DBTest : NSObject <DBSessionDelegate, DBCommonControllerDelegate> {
    NSWindow *window;
    NSButton *linkButton;
    DBLoginController *loginController;
}

@property (nonatomic, assign) IBOutlet NSWindow *window;
@property (nonatomic, assign) IBOutlet NSButton *linkButton;
@property (nonatomic, retain) DBLoginController *loginController;

- (void) awakeFromNib;
- (IBAction) link:(id)sender;
- (void) updateLinkTitle;

@end
