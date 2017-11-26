//
//  DetailsViewController.swift
//  Qrproject
//
//  Created by Suphawat on 22/11/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    enum RowName:NSInteger{
        case List = 0
        case Detail = 1
        case QrImage = 2
        
        
    }
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.delegate = self
        myTable.dataSource = self
        // Do any additional setup after loading the view.
        do{
            let nib2:UINib = UINib(nibName: "DealListTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "DealListTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "DetailTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "DetailTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "FullImageTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "FullImageTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "DetailQrTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "DetailQrTableViewCell")
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
    @objc func openScanQr(sender:UIButton){
        let popup : ScanQrViewController = self.storyboard?.instantiateViewController(withIdentifier: "ScanQrViewController") as! ScanQrViewController
        let navigationController = UINavigationController(rootViewController: popup)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func backBtn(_ sender: UIButton) {
        if let navigation = self.navigationController{
            navigation.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: {
                
            })
        }
    }
}
extension DetailsViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  3
    }
    // MARK: - Cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == RowName.List.rawValue){
            return 250
        }else if(indexPath.row == RowName.Detail.rawValue){
            return 180
        }else if(indexPath.row == RowName.QrImage.rawValue){
            return 150
        }
        return 45
    }
    // MARK: - Header height
    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == RowName.List.rawValue){
            let cell:FullImageTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "FullImageTableViewCell", for: indexPath) as? FullImageTableViewCell
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.Detail.rawValue){
            let cell:DetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.QrImage.rawValue){
            let cell:DetailQrTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DetailQrTableViewCell", for: indexPath) as? DetailQrTableViewCell
           cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.myBtn.addTarget(self, action: #selector(DetailsViewController.openScanQr(sender:)), for: UIControlEvents.touchUpInside)
            return cell!
        }
        
        let cell:FullImageTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "FullImageTableViewCell", for: indexPath) as? FullImageTableViewCell
        
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
    }
    // MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.myTable.deselectRow(at: indexPath, animated: true)
    }
}

