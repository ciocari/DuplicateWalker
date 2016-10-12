//
//  main.m
//  DuplicateWalker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalkerTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc < 2)
        {
            NSLog(@"Use %s directory\n", argv[0]);
            return 1;
        }
        
        NSURL *f = [NSURL fileURLWithPath:[NSString stringWithUTF8String:argv[1]]];
        
        WalkerTest *wt = [[WalkerTest alloc] init];
        [wt startWith:f];
        
    }
    
    return 0;
}
