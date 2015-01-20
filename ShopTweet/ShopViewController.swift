//
//  ShopViewController.swift
//  ShopTweet
//
//  Created by Yoshihisa Katsumata on 2015/01/20.
//  Copyright (c) 2015年 Yoshihisa Katsumata. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopLabel: UILabel!
    
    var shopImageName: String!
    var shopLabelText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shopImage.image = UIImage(named:shopImageName)
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
//        shopImage?.contentMode = UIViewContentMode.ScaleAspectFit
        shopLabel.text = shopLabelText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
