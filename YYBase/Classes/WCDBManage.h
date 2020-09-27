//
//  WCDBManage.h
//  todolist2
//
//  Created by NNU-SCENS on 2020/8/5.
//  Copyright © 2020 NNU-SCENS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface WCDBManage : NSObject

+ (instancetype) sharedManager;
@property (nonatomic, strong) WCTDatabase *dataBase;

@end


NS_ASSUME_NONNULL_END
