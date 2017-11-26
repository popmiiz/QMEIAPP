//
//  ProfileViewController.swift
//  Qrproject
//
//  Created by popmiiz on 10/24/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn


class ProfileViewController: UIViewController {
    enum RowName:NSInteger{
        case Title = 0
        case FullImage = 1
        case Detail = 2
        case QrImage = 3
        case button = 4
    }
    @IBOutlet weak var myTable: UITableView!
    
    @IBAction func didTapSignout(_ sender: AnyObject) {
//        GIDSignIn.sharedInstance().signOut()
//        self.performSegue(withIdentifier: "signOutSegue", sender: self)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
       //didTapSignout(AnyObject)
        // Do any additional setup after loading the view.
        myTable.delegate = self
        myTable.dataSource = self
        // Do any additional setup after loading the view.
        do{
            let nib2:UINib = UINib(nibName: "TitleProfileTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "TitleProfileTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "FullImageTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "FullImageTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "DetailProfileTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "DetailProfileTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "ButtonProfileTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "ButtonProfileTableViewCell")
        }
        do{
            let nib2:UINib = UINib(nibName: "QrTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "QrTableViewCell")
        }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let indexPath = self.myTable.indexPathForSelectedRow
        if let indexPath = indexPath{
            self.myTable.deselectRow(at: indexPath, animated: true)
            
        }
    }
    // [START signout_tapped]
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    @IBAction func didTapSignout(_ sender: AnyObject) {
    //        GIDSignIn.sharedInstance().signOut()
    //    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ProfileViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  5
    }
    // MARK: - Cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == RowName.Title.rawValue){
            return 60
        }else if(indexPath.row == RowName.FullImage.rawValue){
            return 160
        }else if(indexPath.row == RowName.Detail.rawValue){
            return 50
        }else if(indexPath.row == RowName.QrImage.rawValue){
            return 280
        }else if(indexPath.row == RowName.button.rawValue){
            return 45
        }
        return 45
    }
    // MARK: - Header height
    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == RowName.Title.rawValue){
            let cell:TitleProfileTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TitleProfileTableViewCell", for: indexPath) as? TitleProfileTableViewCell
          
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.FullImage.rawValue){
            let cell:FullImageTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "FullImageTableViewCell", for: indexPath) as? FullImageTableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.Detail.rawValue){
            let cell:DetailProfileTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DetailProfileTableViewCell", for: indexPath) as? DetailProfileTableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.QrImage.rawValue){
            let cell:QrTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "QrTableViewCell", for: indexPath) as? QrTableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if(indexPath.row == RowName.button.rawValue){
            let cell:ButtonProfileTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ButtonProfileTableViewCell", for: indexPath) as? ButtonProfileTableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }
        
        let cell:TitleProfileTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TitleProfileTableViewCell", for: indexPath) as? TitleProfileTableViewCell
       
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
    }
    // MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.myTable.deselectRow(at: indexPath, animated: true)
    }
}

