//
//  ViewController.swift
//  HomeWork6-ShopScreen
//
//  Created by Aleksandr Moroshovskyi on 08.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var text2Lable: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var buy2Button: UIButton!
    
    var goods1 = Goods(name: "Материнська плата Asus rog strix b560-e Gaming wifi (s1200 Intel b560 ddr4)",
                       code: "370030773",
                       price: 9531.00,
                       currency: "₴",
                       images: ["motherboard_pic1",
                                "motherboard_pic2",
                                "motherboard_pic3",
                                "motherboard_pic4",
                                "motherboard_pic5",])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        titleLable.text = goods1.name
        codeLabel.text = "Код \(goods1.code)"
        priceLable.text = "\(goods1.price)"
        textLable.text = "Самовивіз з наших магазинів"
        text2Lable.text = "Забрати завтра з 12:00"
    }
        
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return goods1.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell_id", for: indexPath) as? ImgCollectionViewCell {
            
            itemCell.myImage = goods1.images[indexPath.row]
            
            return itemCell
        }
        return UICollectionViewCell()
    }
}

