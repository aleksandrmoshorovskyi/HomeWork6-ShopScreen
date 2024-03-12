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
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    @IBAction func ckickedBuyBtn(_ sender: UIButton) {
        //print("ckickedBuyBtn")
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clickedBuy2Btn(_ sender: UIButton) {
        //print("clickedBuy2Btn")
        self.present(alert2, animated: true, completion: nil)
    }
    
    @IBAction func pageCntrl(_ sender: UIPageControl) {
        
    }
    
    var goods1 = Goods(name: "Материнська плата Asus rog strix b560-e Gaming wifi (s1200 Intel b560 ddr4)",
                       code: "370030773",
                       price: 9531.00,
                       currency: "₴",
                       images: ["motherboard_pic1",
                                "motherboard_pic2",
                                "motherboard_pic3",
                                "motherboard_pic4",
                                "motherboard_pic5",])
    
    let alert = UIAlertController(title: "Купити в кредит", message: "Цією дією Ви погоджуєтесь з умовами договору!", preferredStyle: .alert)
    let aletalertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")})
    
    let alert2 = UIAlertController(title: "Купити зараз", message: "Цією дією Ви погоджуєтесь з умовами договору!", preferredStyle: .alert)
    let aletalertAction2 = UIAlertAction(title: "OK", style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")})
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // create attributed string
        let lableStr1 = "Самовивіз з наших магазинів - "
        let str1Attribute = [ NSAttributedString.Key.foregroundColor: UIColor.black ]
        let lableStr1Attributed = NSAttributedString(string: lableStr1, attributes: str1Attribute)
        
        let lableStr2 = "БЕЗКОШТОВНО"
        let str2Attribute = [ NSAttributedString.Key.foregroundColor: UIColor.systemGreen ]
        let lableStr2Attributed = NSAttributedString(string: lableStr2, attributes: str2Attribute)
        
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.append(lableStr1Attributed)
        attributedString.append(lableStr2Attributed)
        
        titleLable.text = goods1.name
        codeLabel.text = "Код \(goods1.code)"
        priceLable.text = "\(goods1.price)"
        //textLable.text = "Самовивіз з наших магазинів"
        textLable.attributedText = attributedString
        text2Lable.text = "Забрати завтра з 12:00"
        
        buyButton.setTitle("Купити в кредит", for: .normal)
        buyButton.setTitle("Купити в кредит", for: .selected)
        
        buy2Button.setTitle("Купити зараз", for: .normal)
        buy2Button.setTitle("Купити зараз", for: .selected)
        
        alert.addAction(aletalertAction)
        alert2.addAction(aletalertAction2)
        
        pageIndicator.numberOfPages = goods1.images.count
        //pageIndicator.currentPage = 0
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //print("\(indexPath.row)")
        //pageIndicator.currentPage = indexPath.row
        
        //НЕ ПРАЦЮЄ - вивидоть 0, потім одразу 1,2, далі нормально - ???
        //довелось використовувати - scrollViewDidEndDecelerating
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollPosition = scrollView.contentOffset.x / view.frame.width
        pageIndicator.currentPage = Int( round(scrollPosition) )
    }
}
