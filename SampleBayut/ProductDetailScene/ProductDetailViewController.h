//
//  ProductDetailViewController.h
//  SampleBayut
//
//  Created by OfficeUser on 30/11/21.
//

#import <UIKit/UIKit.h>
@class ProductDetailViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailViewController : UIViewController
@property (nonatomic, strong) ProductDetailViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
