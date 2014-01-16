//
//  CartCell.h
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItem.h"
#import "CartDelegate.h"

@interface CartCell : UITableViewCell

@property (weak, nonatomic) id <CartCellDelegate> delegate;
@property (copy, nonatomic) NSString *productCode;

- (void)setCartItem:(CartItem *)item;

@end
