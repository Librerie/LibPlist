//
//  LibPlist.h
//  LibPlist
//
//  Created by Marco Velluto on 04/10/12.
//  Copyright (c) 2012 Algos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LibPlist : NSObject

+ (NSArray *)arrayFromPlistName:(NSString *)plistName;
+ (NSArray *)arrayFromDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *)dictionaryWithString:(NSString *)name;
+ (NSDictionary *)getDictionaryArticoliFromPlistName:(NSString *)plistName;
+ (void)writeDictionary:(NSDictionary *)dictionary fromPlistName:(NSString *)plistName;
+ (NSDictionary *)readPlistName:(NSString *)plistName;

+ (NSDictionary *)createDictionaryWithObject:(NSObject *)obj andKey:(NSString *)key;

@end
