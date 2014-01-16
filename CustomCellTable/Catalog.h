//
//  Catalog.h
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject

- (id)productAt:(NSUInteger)index;
- (NSUInteger)numberOfProducts;

+ (id)defaultCatalog;

@end
