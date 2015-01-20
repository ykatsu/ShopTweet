//
//  ShopViewController.swift
//  ShopTweet
//
//  Created by Yoshihisa Katsumata on 2015/01/20.
//  Copyright (c) 2015年 Yoshihisa Katsumata. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var shopImageName: String!
    var shopLabelText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self

        shopImage.image = UIImage(named:shopImageName)
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
//        shopImage?.contentMode = UIViewContentMode.ScaleAspectFit
        shopLabel.text = shopLabelText
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tweetTableCell", forIndexPath: indexPath) as UITableViewCell
        
        var textView = tableView.viewWithTag(11) as UITextView
        textView.text = "ほげ\(indexPath.row+1)"
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
