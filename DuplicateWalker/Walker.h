//
//  Walker.h
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FileContainer.h"

@protocol Walker <NSObject>

-(FileContainer *) walkOnDir:(NSURL *)directoryToScan;

@optional
-(FileContainer *) walkOnDirs:(NSArray *)directoriesToScan;

@end
