//
//  DuplicateService.m
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "DuplicateService.h"

@implementation DuplicateService

- (void) startDuplicateWalkerAt:(NSURL *)directory
{
    [NSThread detachNewThreadSelector:@selector(createWalkerThreadFor:) toTarget:self withObject:directory];
}

- (void) createWalkerThreadFor:(NSURL *)directory
{
    //TODO: should use a runloop? Create a way to stop de processing if requested.

    DuplicateWalker *w = [[DuplicateWalker alloc] init];
    FileContainer *fcg = [w walkOnDir:directory];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(finishedDuplicateWalker:)])
        [self.delegate finishedDuplicateWalker:((FileContainerWithGrouping*)fcg).groupedFiles];
}

//TODO: should provide a method to stop the task.

@end
