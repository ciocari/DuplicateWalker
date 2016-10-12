//
//  WalkerTest.h
//  DuplicateWalker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DuplicateDelegate.h"

@interface WalkerTest : NSObject<DuplicateDelegate>

-(void) startWith:(NSURL *) directory;

@end
