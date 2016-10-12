//
//  FileContainer.h
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileContainer : NSObject

@property (nonatomic, strong, readonly) NSArray *files;

- (instancetype) initWithArrayOfFiles:(NSMutableArray *)arr;

- (NSArray *) files;

@end
