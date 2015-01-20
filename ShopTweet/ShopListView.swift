//
//  ViewController.swift
//  ShopTweet
//
//  Created by Yoshihisa Katsumata on 2015/01/09.
//  Copyright (c) 2015年 Yoshihisa Katsumata. All rights reserved.
//

import UIKit

class ShopListView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let imgArray: NSArray = ["image2.JPG","image3.JPG","image2.JPG","image3.JPG"]
    let label2Array: NSArray = ["image0","image1","image2","image3"]
    
    var selectedRow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as UITableViewCell
        
        var textView = tableView.viewWithTag(2) as UITextView
        textView.text = "ぷに\(indexPath.row+1)"
        
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
            let subVC: ShopViewController = segue.destinationViewController as ShopViewController
            // [indexPath.row] から画像名を設定
            subVC.shopImageName = "\(imgArray[selectedRow])"
            subVC.shopLabelText = "\(label2Array[selectedRow])"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

