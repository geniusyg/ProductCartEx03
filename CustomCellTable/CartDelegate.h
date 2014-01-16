//
//  CartDelegate.h
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CartDelegate <NSObject>

// 제품을 카트에 추가 (ProductMaster)
- (void)addItem:(id)sender;

@end

@protocol CartCellDelegate <NSObject>

// 제품코드를 이용해서 수량 증가 또는 감소 (Cart)
- (void)incQuantity:(NSString *)productCode;
- (void)decQuantity:(NSString *)productCode;


@end
