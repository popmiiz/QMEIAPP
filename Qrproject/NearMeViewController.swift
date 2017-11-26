//
//  NearMeViewController.swift
//  Qrproject
//
//  Created by Suphawat on 22/11/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit

class NearMeViewController: UIViewController {
    enum RowName:NSInteger{
        case Search = 0
        case Map = 1
        case List = 2
        
        
    }
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.delegate = self
        myTable.dataSource = self
        // Do any additional setup after loading the view.
        do{
            let nib2:UINib = UINib(nibName: "ListNearTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "ListNearTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "MapTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "MapTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "TFSearchTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "TFSearchTableViewCell")
        }
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
extension NearMeViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if(section == RowName.Map.rawValue){
//            return 1
//        }else if(section == RowName.List.rawValue){
//
//            return 5
//        }
        return 3
    }
    // MARK: - Cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == RowName.Search.rawValue){
            return 50
        }else if(indexPath.row == RowName.Map.rawValue){
            return 350
        }else if(indexPath.row == RowName.List.rawValue){
            return 80
        }
        return 45
    }
    // MARK: - Header height
    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == RowName.Search.rawValue){
            let cell:TFSearchTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TFSearchTableViewCell", for: indexPath) as? TFSearchTableViewCell
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.Map.rawValue){
            let cell:MapTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as? MapTableViewCell
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.List.rawValue){
            let cell:ListNearTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListNearTableViewCell", for: indexPath) as? ListNearTableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }
        
        let cell:ListNearTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListNearTableViewCell", for: indexPath) as? ListNearTableViewCell
        
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
    }
    // MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.myTable.deselectRow(at: indexPath, animated: true)
    }
}

