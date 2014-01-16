//
//  ViewController.

//  CustomCellTable
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"
#import "Catalog.h"
#import "CartDelegate.h"
#import "ProductDetailViewController.h"
#import "CartViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CartDelegate,
    UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ProductDetailViewController *dest = (ProductDetailViewController *)segue.destinationViewController;
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    dest.product = product;
}
- (IBAction)addCart:(id)sender {
}

// 카달로그 델리게이트 : 제품을 카트에 추가한다.
- (void)addItem:(id)sender
{
    // 제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [self.cart addProduct:product];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림" message:@"카트에 들어갔습니다" delegate:self cancelButtonTitle:@"닫기" otherButtonTitles:@"확인", nil];
    [alert show];
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
//    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.firstOtherButtonIndex) {
        self.tabBarController.selectedIndex = 1;
        // 강제로 리로드
        // 무식
//        NSArray *controllers = self.tabBarController.viewControllers;
//        CartViewController *cartController = (CartViewController *)controllers[1];
//        [cartController forceReloadTable];
        
    }
}

// 섹션 2개 설정(0: 카달로그, 1 : 카트)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Catalog defaultCatalog] numberOfProducts];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return (0 == section) ? @"Product" : @"Items in Cart";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 첫 번째 섹션(카달로그)
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        
        // 뷰 컨트롤러(self)가 셀의 델리게이트 역할을 수행한다.
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cart = [Cart defaultCart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
