//
//  Cart.m
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"
#import "CartDelegate.h"

@interface Cart()

@end


@implementation Cart

// 싱글톤 메소드
static Cart *_instance = nil;

+ (id)defaultCart
{
    if (nil == _instance) {
        _instance = [[Cart alloc] init];
    }
    return _instance;
}

- (id) init
{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}
// 카트에 제품 추가
- (void)addProduct:(Product *)item
{
    CartItem *cartItem = [self cartItemWith:item.code];

    // 동일 제품 검색 실패 -> 새로운 상품을 카트에 추가
    if (cartItem == nil) {
        cartItem = [[CartItem alloc] init];
        cartItem.product = item;
        cartItem.quantity = 1;
        [self.items addObject:cartItem];
    }
    
    // 동일 제품 검색 성공 -> 제품 수량 증가
    else {
        [self incQuantity:item.code];
    }
}

// 카트 내 상품수량 증가
- (void)incQuantity:(NSString *)productCode
{
    CartItem *item = [self cartItemWith:productCode];
    item.quantity++;
}

// 카트 내 상품수량 감소
- (void)decQuantity:(NSString *)productCode {
    CartItem *item = [self cartItemWith:productCode];
    item.quantity--;
    
    // 제품수량이 0이면 삭제
    if (0 == item.quantity) {
        [self.items removeObject:item];
    }
}

// 상품코드로 카트 내 동일상품 찾기
- (CartItem *)cartItemWith:(NSString *)productCode
{
    for (CartItem *item in self.items) {
        if([item.product isEqualProduct:productCode]) {
            return item;
        }
    }
    return nil;
}

@end
