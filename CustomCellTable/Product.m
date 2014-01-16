//
//  Product.m
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Product.h"

@implementation Product

// 팩토리 메소드
+ (id)product:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)image
{
    Product *item = [[Product alloc] init];
    item.name = name;
    item.code = code;
    item.price = price;
    item.imageName = image;
    
    return item;
}

// 동일 제품 비교
- (BOOL)isEqualProduct:(NSString *)productCode
{
    return [self.code isEqualToString:productCode];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
