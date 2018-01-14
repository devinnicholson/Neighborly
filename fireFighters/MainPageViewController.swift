//
//  MainPageViewController.swift
//  fireFighters
//
//  Created by shelby chen on 1/13/18.
//  Copyright © 2018 shelby chen. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension MainPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableViewCell: UITableViewCell
        tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell")!
        
        if indexPath.row == 0 {
            var imageTableViewCell : ImageTableViewCell!
            imageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageTableViewCell!
            imageTableViewCell.imgView.image = UIImage.init(named: "DONATE.png")
            tableViewCell = imageTableViewCell
        }
        else if indexPath.row == 1 {
            //TODO
            var sideScrollTableViewCell : SideScrollTableViewCell!
            sideScrollTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SidescrollCell") as! SideScrollTableViewCell!
            tableViewCell = sideScrollTableViewCell
            
            
//            var itemTableViewCell : ItemTableViewCell!
//            itemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemTableViewCell
//            itemTableViewCell.itemImageView.image = UIImage.init(named: "Unknown.png")
//            tableViewCell = itemTableViewCell
            //            var itemTableViewCell : DonationTableViewCell!
            //            itemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "donationCell") as! DonationTableViewCell
            //            tableCellView = itemTableViewCell
            
        }
        else if indexPath.row == 2{
            var imageTableViewCell : MapTableViewCell!
            imageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MapCell") as! MapTableViewCell!
            tableViewCell = imageTableViewCell
            //tableViewCell = tableView.dequeueReusableCell(withIdentifier: "mapCell")!
        }
        
        return tableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("fdfdf")
        if indexPath.row == 0 {
            return 550.0
        }
        else if indexPath.row == 1 {
            return 0.0
        }
        else if indexPath.row == 2 {
            return 550.0
        }
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
            
            let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "JacketViewController") as! UIViewController
           
            
            
            self.present(viewController, animated: true, completion: nil)
            
        }
    }
}
