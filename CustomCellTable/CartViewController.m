//
//  CartViewController.m
//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartViewController.h"
#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"
#import "CartDelegate.h"

@interface CartViewController () <UITableViewDataSource, CartCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) Cart *cart;

@end

@implementation CartViewController

- (void)forceReloadTable {
    [self.table reloadData];
}
- (IBAction)minusQuantity:(id)sender {
}
- (IBAction)plusQuantity:(id)sender {
}

// 카트 내 상품 수량 증가
- (void)incQuantity:(NSString *)productCode
{
    [self.cart incQuantity:productCode];
    
    [self.table reloadData];
}

// 카트 내 상품 수량 감소
- (void)decQuantity:(NSString *)productCode
{
    [self.cart decQuantity:productCode];
    
    [self.table reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Cart *cart = [Cart defaultCart];
    return cart.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 두 번째 섹션(카트)
        CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        cell.delegate = self;
    CartItem *cartItem = self.cart.items[indexPath.row];
        [cell setCartItem:cartItem];
        
        return cell;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.cart = [Cart defaultCart];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"Cart view");
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
