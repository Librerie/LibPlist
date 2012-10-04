//
//  LibPlist.m
//  LibPlist
//
//  Created by Marco Velluto on 04/10/12.
//  Copyright (c) 2012 Algos. All rights reserved.
//

#import "LibPlist.h"

@implementation LibPlist

//--- lista articoli in ordine alfabetico
//--- legge dictionary
//--- crea lista articoli

+ (NSArray *)arrayFromPlistName:(NSString *)plistName {
    
    NSDictionary *dictionary = [LibPlist dictionaryWithString:plistName];
    NSArray *listaOggetti = [LibPlist arrayFromDictionary:dictionary];
    listaOggetti = [listaOggetti sortedArrayUsingSelector:@selector(compare:)];
    
    return listaOggetti;
}

+ (NSArray *)arrayFromDictionary:(NSDictionary *)dictionary {
    
    NSMutableArray *listaTemp = [[NSMutableArray alloc] init];
    for (id key in dictionary) {
        
        id value = [dictionary objectForKey:key];
        
        for (id riga in value) {
            
            id stringa = (NSString *)riga;
            //NSLog(@"Stringa = '%@'", stringa);
            [listaTemp addObject:stringa];
        }
    }
    return [[NSArray alloc] initWithArray:listaTemp];
}

+ (NSDictionary *)dictionaryWithString:(NSString *)name {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return dictionary;
}

+ (NSDictionary *)getDictionaryArticoliFromPlistName:(NSString *)plistName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return dictionary;
    
}

+ (void)writeDictionary:(NSDictionary *)dictionary fromPlistName:(NSString *)plistName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    [dictionary writeToFile:path atomically:YES];
}

+ (NSDictionary *)readPlistName:(NSString *)plistName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    return savedStock;
}

#pragma  mark - Metodi di comodo

+ (NSDictionary *)createDictionaryWithObject:(NSObject *)obj andKey:(NSString *)key {
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:obj, key, nil];
    return dic;
}

/*
- (NSArray *)listaArticoli {
    static NSString *namePlist = @"articoli";
    
    //--- legge dictionary
    NSDictionary *dictionary = [self dictionaryWithString:namePlist];
    
    //--- crea lista articoli
    NSArray *listaArticoli = [self articoliFromDictionary:dictionary];
    
    //--- ordina in modo alfabetico
    listaArticoli = [listaArticoli sortedArrayUsingSelector:@selector(compare:)];
    
    return listaArticoli;
    
}
*/



@end
