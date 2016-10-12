//
//  File.h
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "zlib.h"

@interface File : NSObject

@property NSString* name;
@property NSString* localizedName;
@property NSNumber* size;
@property NSURL*    url;

// Returns the checksum of this file.
// (Calculated on demand.)
-(NSUInteger) checkSum;

@end
