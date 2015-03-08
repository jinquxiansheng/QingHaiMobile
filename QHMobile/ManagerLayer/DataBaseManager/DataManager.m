//
//  DataManager.m
//  AuthDemo
//
//  Created by yao on 14-8-3.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "DataManager.h"
#import "JSONKit.h"
#import "FMDB.h"
#import "LoginUserModel.h"
static  DataManager     *manager = nil;

@interface DataManager ()
{
    NSMutableArray  *_sleepDataArray;
}
@property (nonatomic,retain)FMDatabase *db;
@end

@implementation DataManager
- (void)dealloc
{
    [self.db close];
    self.db = nil;
}

+(DataManager *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        manager = [[DataManager alloc] init];
    } );
    return manager;
}

- (void)createDatabase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MobileWork.db"];
    self.db  = [FMDatabase databaseWithPath:dbPath] ;
    if (![self.db open]) {
        return ;
    }
    [self creatTestTable];
}
-(void)creatTestTable
{
    
    //先判断数据库是否存在，如果不存在，创建数据库
    if(!self.db)
    {
        [self createDatabase];
    }
    //判断数据库是否已经打开，如果没有打开，提示失败
    if(![self.db open])
    {
        NSLog(@"数据库打开失败");
        return;
    }
    //为数据库设置缓存，提高查询效率
    [self.db setShouldCacheStatements:YES];
    
    //判断数据库中是否已经存在这个表，如果不存在则创建该表
    if(![self.db tableExists:@"TestShopTable"])
    {
         NSLog(@"创建完成");
        //[self.db executeUpdate:@"CREATE TABLE TestShopTable (key text,info text,curdate)"];
        [self.db executeUpdate:@"CREATE TABLE Employee (id INTEGER PRIMARY KEY,userID text,pwd text,sign text,curdate date)"];


    }
}
- (BOOL)saveEmployeeWithID:(NSString *)Id  pwd:(NSString *)pwd rememberPwd:(NSString *)remSign
{
    if (!self.db) {
        [self createDatabase];
    }
    int rowCount = [self.db intForQuery:@"SELECT count(*) FROM Employee where userID = ?",Id];
    if (rowCount == 0) {

        return [self.db executeUpdate:@"INSERT INTO Employee (userID, pwd,sign,curdate) VALUES (?,?,?,?)",Id,[self passwpordSign:remSign pwd:pwd],remSign,[[NSDate date] debugDescription]];
    }
    else
    {
        NSLog(@"%@,%@",[self passwpordSign:remSign pwd:pwd],[[NSDate date] debugDescription]);
        return [self.db executeUpdate:@"update Employee set pwd = ? , sign = ? ,curdate = ? where userID = ?",[self passwpordSign:remSign pwd:pwd],remSign,[[NSDate date] debugDescription],Id];
         FMResultSet *rs = [self.db executeQuery:@"select * from Employee where userId = ?",Id];
        while ([rs next]) {
            NSLog(@"%@",[rs stringForColumn:@"curdate"]);

        }
    }
    return FALSE;

}
- (NSString *)passwpordSign:(NSString *)remSign pwd:(NSString *)pwd
{
    return  [remSign isEqualToString:@"1"] ? pwd : @"";
}
- (LoginUserModel *)selectLoginInfo
{
    LoginUserModel *model = [[LoginUserModel alloc] init];
    FMResultSet *rs = [self.db executeQuery:@"select  * FROM Employee order by  curdate desc limit 0,1"];
    
    while ([rs next]) {
        model.pwd = [rs stringForColumn:@"pwd"];
        model.Id = [rs stringForColumn:@"userID"];
        model.remSign = [rs stringForColumn:@"sign"];
    }
    // NSLog(@"%@",resultDict);
    return model;

}

- (LoginUserModel *)selectPwdWithID:(NSString *)Id
{
    LoginUserModel *model = [[LoginUserModel alloc] init];
    FMResultSet *rs = [self.db executeQuery:@"select  * FROM Employee where userID = ?",Id];
    while ([rs next]) {
        model.pwd = [rs stringForColumn:@"pwd"];
        model.Id = [rs stringForColumn:@"userID"];
        model.remSign = [rs stringForColumn:@"sign"];
    }
    // NSLog(@"%@",resultDict);
    return model;

}
- (BOOL)deletePwdWithId:(NSString *)Id
{
    if (!self.db) {
        [self createDatabase];
    }
    int rowCount = [self.db intForQuery:@"SELECT count(*) FROM Employee where ID = ?",Id];
    if (rowCount > 0) {
        return [self.db executeUpdate:@"delete  from Employee where ID = ?",Id];
    }
    return FALSE;

}
- (BOOL)saveTestData:(id)object
{
    if (!self.db) {
        [self createDatabase];
    }
    NSString *dateStr = [[NSDate date] debugDescription];
    NSString *jsonStr = [object JSONString];
    int rowCount = [self.db intForQuery:@"SELECT count(*) FROM TestShopTable where key = ?",@"id"];
    if (rowCount == 0) {
        return [self.db executeUpdate:@"INSERT INTO TestShopTable (key, info,curdate) VALUES (?,?,?)",@"id",jsonStr,dateStr];
    }
   //   [dataDict setObject:[[NSDate date] description] forKey:INTERNALCACHE_KEY_CACHETIME];
   
    BOOL flag = [self.db executeUpdate:@"UPDATE  TestShopTable set info = ? ,curdate = ? where key = ?",jsonStr,dateStr,@"id"];
    return flag;
}

- (NSString *)selectQuery:(NSDate **)date
{
    FMResultSet *rs = [self.db executeQuery:@"SELECT * FROM testshoptable"];
     NSString *result =  nil;
    while ([rs next]) {
       result = [rs stringForColumn:@"info"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZ"];
        if( [rs stringForColumn:@"curdate"] )
        {
            *date = [dateFormatter dateFromString: [rs stringForColumn:@"curdate"] ];
        }

    }
   // NSLog(@"%@",resultDict);
    return result;
}
@end