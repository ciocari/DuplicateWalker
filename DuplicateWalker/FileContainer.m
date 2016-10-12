//
//  FileContainer.m
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "FileContainer.h"

@interface FileContainer()

@property (nonatomic, strong, readwrite) NSArray *files;

@end

@implementation FileContainer

- (instancetype) initWithArrayOfFiles:(NSArray *)arr
{
    self = [super init];
    
    if (self) {
        _files = [arr mutableCopy];
    }
    
    return self;
}

- (NSArray *) files
{
    return [_files copy];
}

@end
