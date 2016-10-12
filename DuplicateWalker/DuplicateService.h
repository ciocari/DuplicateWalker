//
//  DuplicateService.h
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DuplicateWalker.h"
#import "DuplicateDelegate.h"

@interface DuplicateService : NSObject

@property(nonatomic,weak) id<DuplicateDelegate> delegate;

- (void) startDuplicateWalkerAt:(NSURL *)directory;

- (void) createWalkerThreadFor:(NSURL *)directory;

@end
