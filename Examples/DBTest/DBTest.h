//
//  DBTest.h
//  DropboxFramework
//
//  Created by Jørgen P. Tjernø on 1/16/11.
//  Copyright 2011 devSoft. All rights reserved.
//

#import "DBSession.h"

@interface DBTest : NSObject <DBSessionDelegate> {
    NSWindow *window;
    NSButton *linkButton;
}

@property (nonatomic, assign) IBOutlet NSWindow *window;
@property (nonatomic, assign) IBOutlet NSButton *linkButton;

- (void) awakeFromNib;
- (IBAction) link:(id)sender;
- (void) updateLinkTitle;

@end
