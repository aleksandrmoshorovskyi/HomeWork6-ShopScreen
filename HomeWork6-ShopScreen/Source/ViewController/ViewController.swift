//
//  ViewController.swift
//  HomeWork6-ShopScreen
//
//  Created by Aleksandr Moroshovskyi on 08.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var TitleLable: UILabel!
    
    var itemMenuArray: [Menu] = {
        var img1 = Menu()
        img1.name = "1"
        img1.imageName = "motherboard_pic1"
        
        var img2 = Menu()
        img2.name = "1"
        img2.imageName = "motherboard_pic2"
        
        return [img1, img2]
    }()
    
    var goods1 = Goods(name: "Материнська плата Asus rog strix b560-e Gaming wifi (s1200 Intel b560 ddr4)",
                       code: "370030773",
                       price: 9531.00,
                       images: ["motherboard_pic1",
                                "motherboard_pic2",
                                "motherboard_pic3",
                                "motherboard_pic4",
                                "motherboard_pic5",])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        TitleLable.text = goods1.name
    }
        
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return itemMenuArray.count
        return goods1.images.count
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell_id", for: indexPath) as? ImgCollectionViewCell {
            
            //itemCell.menu = itemMenuArray[indexPath.row]
            itemCell.myImage = goods1.images[indexPath.row]
            
            return itemCell
        }
        return UICollectionViewCell()
    }
}

