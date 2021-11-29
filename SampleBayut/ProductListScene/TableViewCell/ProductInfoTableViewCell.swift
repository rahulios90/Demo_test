//
//  ProductListTableViewCell.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import UIKit

final class ProductInfoTableViewCell: UITableViewCell, ReuseIdentifying, NibInstantiable {

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var price: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.image = nil
        name.text = nil
        price.text = nil
    }
    
    override func prepareForReuse() {
        productImageView.image = nil
    }

    func configure(_ prodcut: Product) {
        name.text = prodcut.name
        price.text = prodcut.price
        
        productImageView.image = nil
        guard let imageUrl = prodcut.thumbnails.first else { return }
        productImageView.setImage(url: imageUrl)
    }
}
