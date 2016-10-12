//
//  File.m
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "File.h"

@implementation File

#define BLOCK_SIZE   8192      // 8 KB

-(NSUInteger) checkSum
{
    NSMutableData *comparisonData = [[NSMutableData alloc] init];
    NSInputStream *data = [NSInputStream inputStreamWithURL:self.url];
    
    uint8_t buffer[BLOCK_SIZE];
    NSInteger blockSize;
    unsigned long position = 0x0;;
    
    [data open];
    
    while((blockSize = [data read:buffer maxLength:BLOCK_SIZE]) != 0) {
        if(blockSize > 0) {
            [comparisonData appendBytes:buffer length:blockSize];
        } else {
            NSLog(@"Error reading: %@\n. Ignored.", [self.url absoluteString]);
            break;
        }
        
        // repositioning the offset 3% ahead
        position += (unsigned long)(blockSize + ([self.size longValue] * 0.03));
        
        if (![data setProperty:[NSNumber numberWithUnsignedLong:position] forKey:NSStreamFileCurrentOffsetKey])
            break;
    }
    
    [data close];
    
    return crc32(0, comparisonData.bytes, (unsigned int)comparisonData.length) + [self.size unsignedLongValue];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (size: %@)", [_url absoluteString], self.size];
}

@end
