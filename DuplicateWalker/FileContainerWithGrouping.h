//
//  FileContainer.h
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FileContainer.h"

@interface FileContainerWithGrouping : FileContainer

@property (nonatomic, strong, readonly) NSDictionary *groupedFiles;

- (instancetype) initWithArrayOfFiles:(NSArray *)arr groupBy:(NSNumber* (^)(id obj))keyBlock;

- (FileContainer *) applyFilter:(BOOL (^)(id key, id obj))filterBlock;

@end
