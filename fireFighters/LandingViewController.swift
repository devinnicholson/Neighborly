//
//  LandingViewController.swift
//  fireFighters
//
//  Created by shelby chen on 1/13/18.
//  Copyright © 2018 shelby chen. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableCellView : UITableViewCell!
    
        if indexPath.row == 0 {
            var itemTableViewCell : ItemTableViewCell!
            itemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell
            itemTableViewCell.itemImageView.image = UIImage.init(named: "DONATE.png")
            tableCellView = itemTableViewCell
        }
        else if indexPath.row == 1 {
            
            //TODO
            var itemTableViewCell : ItemTableViewCell!
            itemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell
            itemTableViewCell.itemImageView.image = UIImage.init(named: "Unknown.png")
            tableCellView = itemTableViewCell
//            var itemTableViewCell : DonationTableViewCell!
//            itemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "donationCell") as! DonationTableViewCell
//            tableCellView = itemTableViewCell
            
        }else{
            tableCellView = tableView.dequeueReusableCell(withIdentifier: "mapCell")!
        }
        
        return tableCellView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 1334.0
        }
        return 10.0
    }
}
