//
//  FileContainer.m
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "FileContainerWithGrouping.h"

@interface FileContainerWithGrouping()

@property (strong, readwrite) NSMutableDictionary *groupedFiles;

@end

@implementation FileContainerWithGrouping

@synthesize files = _files;

- (instancetype) initWithArrayOfFiles:(NSArray *)arr groupBy:(NSNumber* (^)(id obj))keyBlock
{
    self = [super init];
    
    if (self) {
        NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
        
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSMutableArray *currentObjArr = [d objectForKey:keyBlock(obj)];
            
            if (currentObjArr == nil) {
                currentObjArr = [[NSMutableArray alloc] init];
                [d setObject:currentObjArr forKey:keyBlock(obj)];
            }
            
            [currentObjArr addObject:obj];
        }];
        
        _groupedFiles = [d copy];
    }
    
    return self;
}

- (NSArray *) files
{
    if (!_files) {
        NSMutableArray *f = [[NSMutableArray alloc] init];
        
        [_groupedFiles enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [f addObjectsFromArray:obj];
        }];
        
        _files = [f copy];
    }
    
    return _files;
}

- (NSDictionary *) getGroupedFiles
{
    return [_groupedFiles copy];
}

-(FileContainer *) applyFilter:(BOOL (^)(id key, id obj))filterBlock
{
    NSMutableDictionary *filteredFiles = [[NSMutableDictionary alloc] init];
    
    [_groupedFiles enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (filterBlock(key, obj))
            [filteredFiles setObject:obj forKey:key];
    }];
    
    _groupedFiles = filteredFiles;
    _files = nil; // As the file list changed, reset the files array to be calculated again.
    
    return self;
}

@end
