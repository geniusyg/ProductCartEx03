//
//  ProductCell.h
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CartDelegate.h"

@interface ProductCell : UITableViewCell

// 제품정보를 셀에 반영
- (void)setProductInfo:(Product *)item;

@property (weak)id <CartDelegate> delegate;

@end
