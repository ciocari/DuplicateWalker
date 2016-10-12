//
//  DuplicateWalker.m
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "DuplicateWalker.h"

@implementation DuplicateWalker

-(FileContainer *) walkOnDir:(NSURL *)directoryToScan
{
    FileContainerWithGrouping *fc = [[FileContainerWithGrouping alloc] initWithArrayOfFiles:[[[SameSizeWalker alloc] init] walkOnDir:directoryToScan].files groupBy:^NSNumber *(id obj) {
        return [NSNumber numberWithLong:[obj checkSum]];
    }];
    
    // Make sure we have at least two ocurrences of the same checksum. Otherwise, discard the value.
    [fc applyFilter:^BOOL(id key, id obj) {
        return [obj count] > 1;
    }];
    
    return fc;
}

@end
