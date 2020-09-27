//
//  WCDBManage.m
//  todolist2
//
//  Created by NNU-SCENS on 2020/8/5.
//  Copyright © 2020 NNU-SCENS. All rights reserved.
//

#import "WCDBManage.h"
#define kDataBaseFileName @"myWCDB.sqlite"

@interface WCDBManage ()


@end

@implementation WCDBManage

+ (instancetype)sharedManager {
    static WCDBManage *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        manager = [[WCDBManage alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createDataBase];
    }
    return self;
}

- (void)createDataBase {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dbPath = [documentPath stringByAppendingString:kDataBaseFileName];
    self.dataBase = [[WCTDatabase alloc] initWithPath:dbPath];
}

@synthesize dataBase = _dataBase;

@end
