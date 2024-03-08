//
//  ImgCollectionViewCell.swift
//  HomeWork6-ShopScreen
//
//  Created by Aleksandr Moroshovskyi on 08.03.2024.
//

import UIKit

class ImgCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var menu: Menu? {
        didSet {
            if let image = menu?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }

}
