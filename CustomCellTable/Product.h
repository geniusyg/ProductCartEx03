//
//  Product.h
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *name, *price, *imageName;
@property (strong, nonatomic) NSString *code;

// 팩토리 메소드
+ (id)product:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)image;

// 동일 제품 비교
- (BOOL)isEqualProduct:(NSString *)productCode;

@end
