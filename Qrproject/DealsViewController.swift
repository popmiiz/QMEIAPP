//
//  DealsViewController.swift
//  Qrproject
//
//  Created by Suphawat on 22/11/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController {

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
extension DealsViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  6
    }
    // MARK: - Cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 199
    }
    // MARK: - Header height
    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DealListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "DealListTableViewCell", for: indexPath) as? DealListTableViewCell
       
        
        return cell!
    }
    // MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.myTable.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        let vc:DetailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
