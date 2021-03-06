//
//  ViewController.swift
//  ShopTweet
//
//  Created by Yoshihisa Katsumata on 2015/01/09.
//  Copyright (c) 2015年 Yoshihisa Katsumata. All rights reserved.
//

import UIKit
import Accounts
import Social

class ShopListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let shopImages: NSArray = ["image2.JPG","image3.JPG","image2.JPG","image3.JPG"]
    let shopNames: NSArray = ["image0","image1","image2","image3"]
    
    var selectedRow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        var cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as UITableViewCell
        
        var img = UIImage(named:"\(shopImages[indexPath.row])")
        // Tag番号 1 で UIImageView インスタンスの生成
        var imageView = tableView.viewWithTag(1) as UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        var textView = tableView.viewWithTag(2) as UITextView
        textView.text = "\(shopNames[indexPath.row])"

        return cell
    }
    
    // Cell が選択された場合
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        selectedRow = indexPath.row
        
        // ShopController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("pushToShop",sender: nil)
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "pushToShop") {
            let subVC: ShopTimelineViewController = segue.destinationViewController as ShopTimelineViewController
            // [indexPath.row] から画像名を設定
            subVC.shopImageName = "\(shopImages[selectedRow])"
            subVC.shopNameText = "\(shopNames[selectedRow])"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

