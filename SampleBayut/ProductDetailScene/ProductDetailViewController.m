//
//  ProductDetailViewController.m
//  SampleBayut
//
//  Created by OfficeUser on 30/11/21.
//

#import "ProductDetailViewController.h"
#import "SampleBayut-Swift.h"

@interface ProductDetailViewController ()
@property(weak, nonatomic) IBOutlet UIImageView *productImageview;
@property(weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(weak, nonatomic) IBOutlet UILabel *priceLabel;
@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    [self bindUI];
    // Do any additional setup after loading the view.
}

- (void)configureUI {
    self.nameLabel.font = UIFont.body1;
    self.priceLabel.font = UIFont.body1;
}

- (void)bindUI {
    self.title = @"Product Detail";
    [self.productImageview setImageWithUrl: self.viewModel.product.imageURLs.firstObject placeholderImage:nil];
    self.nameLabel.text = self.viewModel.product.name;
    self.priceLabel.text = self.viewModel.product.price;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
