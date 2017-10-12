//
//  FMDatabaseQueue+Encryption.m
//  FMDB
//
//  Created by 宋庆功 on 16/9/27.
//  Copyright © 2016年 思源. All rights reserved.
//

#import "FMDatabaseQueue+Encryption.h"
#import "FMDatabase.h"

#if FMDB_SQLITE_STANDALONE
#import <sqlite3/sqlite3.h>
#else
#import <sqlite3.h>
#endif

static const void * const kDispatchQueueSpecificKey = &kDispatchQueueSpecificKey;

@implementation FMDatabaseQueue (ToonEncryption)

+ (instancetype)databaseQueueWithPath:(NSString *)aPath
                             password:(NSString *)password
{
    FMDatabaseQueue *q = [[self alloc] initWithPath:aPath flags:SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE vfs:nil password:password];
    
    FMDBAutorelease(q);
    
    return q;
}

- (instancetype)initWithPath:(NSString *)aPath
                       flags:(int)openFlags
                         vfs:(NSString *)vfsName
                    password:(NSString *)password
{
    self = [super init];
    
    if (self != nil) {
        
        _db = [[[self class] databaseClass] databaseWithPath:aPath];
        FMDBRetain(_db);
        
#if SQLITE_VERSION_NUMBER >= 3005000
        BOOL success = [_db openWithFlags:openFlags vfs:vfsName];
#else
        BOOL success = [_db open];
#endif
        if (!success) {
            NSLog(@"Could not create database queue for path %@", aPath);
            FMDBRelease(self);
            return 0x00;
        }else{  // 数据库加密
            [_db setKey:password];
        }
        
        _path = FMDBReturnRetained(aPath);
        
        _queue = dispatch_queue_create([[NSString stringWithFormat:@"fmdb.%@", self] UTF8String], NULL);
        dispatch_queue_set_specific(_queue, kDispatchQueueSpecificKey, (__bridge void *)self, NULL);
        _openFlags = openFlags;
        _vfsName = [vfsName copy];
    }
    
    return self;
}

@end
