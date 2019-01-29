//
//  FMDatabaseQueue+Encryption.h
//  FMDB
//
//  Created by 宋庆功 on 16/9/27.
//  Copyright © 2016年 公司名. All rights reserved.
//

#import <FMDB/FMDB.h>

@interface FMDatabaseQueue (Encryption)

+ (instancetype)databaseQueueWithPath:(NSString *)aPath
                             password:(NSString *)password;

- (instancetype)initWithPath:(NSString *)aPath
                       flags:(int)openFlags
                         vfs:(NSString *)vfsName
                    password:(NSString *)password;

@end
