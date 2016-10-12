//
//  WalkerTest.m
//  DuplicateWalker
//
//  Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "WalkerTest.h"
#import "DuplicateService.h"

@implementation WalkerTest

-(void) startWith:(NSURL *) directory
{
    DuplicateService *ds = [[DuplicateService alloc] init];
    ds.delegate =  self;
    [ds createWalkerThreadFor:directory];
}

-(void) finishedDuplicateWalker:(NSDictionary *) duplicatedFiles
{
    if (duplicatedFiles.count > 0) {
        
        [duplicatedFiles enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"CRC32: %lu\nFiles:\n", [(NSNumber *)key longValue]);
            
            NSArray *FileList = (NSArray *)obj;
            
            for (id file in FileList) {
                NSLog(@"\t%@", file);
            }

        }];
    }
    else {
        NSLog(@"No duplicated files found.\n");
    }
}

@end
