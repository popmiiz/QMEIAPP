//
//  ComPassViewController.swift
//  Qrproject
//
//  Created by popmiiz on 10/31/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit

class ComPassViewController: UIViewController {
    
    
    
    enum RowName:NSInteger{
        case Space = 0
    }
    
    var myArray = ["Image-1","Image-2","Image-3","Image-4","Image-5"]
    var myContentArray = ["Super hot","The best","New menu","Super sale","For you"]
    var myNameArray = ["Mexicanbar","Sandinha","Factory","Berlin","Sebastien"]
    var myKilomateArray = ["1.5 KM","2 KM","1.3 KM","2 KM","1.5 KM"]
    var myiconArray = ["icon-1","icon-2","icon-3","icon-4","icon-5"]
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        // Do any additional setup after loading the view.
        do{
            let nib2:UINib = UINib(nibName: "ListTableViewCell", bundle: nil)
            self.myTable.register(nib2, forCellReuseIdentifier: "ListTableViewCell")
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let indexPath = self.myTable.indexPathForSelectedRow
        if let indexPath = indexPath{
            self.myTable.deselectRow(at: indexPath, animated: true)
            
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
extension ComPassViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  myArray.count
    }
    // MARK: - Cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    // MARK: - Header height
    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell
        cell?.imgView.image = UIImage(named: myArray[indexPath.row])
        cell?.contLabel.text = myContentArray[indexPath.row]
        cell?.nameResLabel.text = myNameArray[indexPath.row]
        cell?.kilomateLabel.text = myKilomateArray[indexPath.row]
        cell?.iconloView.image = UIImage(named: myiconArray[indexPath.row])
        
        return cell!
    }
    // MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.myTable.deselectRow(at: indexPath, animated: true)
    }
}
