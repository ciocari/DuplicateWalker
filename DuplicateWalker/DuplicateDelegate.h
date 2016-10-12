//
//  DuplicateDelegate.h
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DuplicateDelegate <NSObject>

-(void) finishedDuplicateWalker:(NSDictionary *) duplicatedFiles;

@optional
// Called whenever the current progress changes (1...100%)
-(void) currentProgress:(int)value;

// returns YES if the rest of the execution should be stoped.
-(BOOL) onWalkerError:(NSError *) err;

@end
