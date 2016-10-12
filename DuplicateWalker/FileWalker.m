//
//  FileWalker.m
//  Duplicate Walker
//
// Copyright © 2016 Juliano Ciocari. All rights reserved.
//

#import "FileWalker.h"

@implementation FileWalker

-(FileContainer *) walkOnDir:(NSURL *)directoryToScan
{
    //TODO implement file type ignore
    
    NSFileManager *fm = [[NSFileManager alloc] init];
    
    NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtURL:directoryToScan
                                    includingPropertiesForKeys:@[ NSURLNameKey,
                                                                  NSURLLocalizedNameKey,
                                                                  NSURLIsRegularFileKey,
                                                                  NSURLIsWritableKey,
                                                                  NSURLFileSizeKey ]
                                                       options: NSDirectoryEnumerationSkipsHiddenFiles | NSDirectoryEnumerationSkipsPackageDescendants
                                                  errorHandler:^(NSURL *url, NSError *error) {
                                                      //TODO: handle errors
                                                      NSLog(@"Erro:\nURL:%@\n%@", [url absoluteString], [error localizedDescription]);
                                                      return YES;
                                                  }];
    
   NSMutableArray *fileList = [NSMutableArray array];
    
    for (NSURL *theURL in dirEnumerator) {
        NSNumber *isRegularFile, *isWriteable;
        
        [theURL getResourceValue:&isRegularFile forKey:NSURLIsRegularFileKey error:NULL];
        [theURL getResourceValue:&isWriteable forKey:NSURLIsWritableKey error:NULL];
        
        if ([isRegularFile boolValue] && [isWriteable boolValue]) {
            File *f = [File new];
            NSNumber *size;
            NSString *name, *localizedName;
            
            [theURL getResourceValue:&size forKey:NSURLFileSizeKey error:NULL];
            [theURL getResourceValue:&name forKey:NSURLNameKey error:NULL];
            [theURL getResourceValue:&localizedName forKey:NSURLLocalizedNameKey error:NULL];

            //TODO: despite any configuration, gemini does't compare files < 8KB
            //      Should we do the same?
            if ([size intValue] < 8192)
                continue;
            
            f.url = theURL;
            f.size = size;
            f.name = name;
            f.localizedName = localizedName;
            
            [fileList addObject:f];
        }
    }
    
    return [[FileContainer alloc] initWithArrayOfFiles:fileList];
}

/*
-(NSArray *) walkOnDirs:(NSArray *)directoriesToScan
{
    NSMutableArray *fileList = [NSMutableArray array];

    [directoriesToScan enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [fileList addObjectsFromArray:[self walkOnDir:obj]];
    }];
    
    return fileList;
}
 */

@end
