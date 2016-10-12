//
//  SameSizeFilesWalker.m
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "SameSizeWalker.h"

@implementation SameSizeWalker

-(FileContainer *) walkOnDir:(NSURL *)directoryToScan
{
    NSArray *files = [[[FileWalker alloc] init] walkOnDir:directoryToScan].files;
    
    FileContainerWithGrouping *fc = [[FileContainerWithGrouping alloc] initWithArrayOfFiles:files groupBy:^NSNumber *(id obj) {
        return [(File*)obj size];
    }];
    
    [fc applyFilter:^BOOL(id key, id obj) {
        return [obj count] > 1;
    }];
    
    return fc;
}

@end
