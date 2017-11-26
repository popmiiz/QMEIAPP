//
//  MasterViewController.swift
//  Qrproject
//
//  Created by popmiiz on 10/24/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    enum ModeDisplay:NSInteger{
        case One = 0
        case Two = 1
        case Three = 2
    }
    
    
    @IBOutlet weak var btnHotDeal: UIButton!
    @IBOutlet weak var btnForYou: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    
    var myHomeContainer : HomeContainerVC? = nil
    @IBAction func tapHotDeal(_ sender: UIButton) {
        if let conVC = self.myHomeContainer{
           conVC.swapToview(identifier : segToHotDeal)
        }
        self.selectMode(mode: .One)
    }
    
    @IBAction func tapForYou(_ sender: UIButton) {
        if let conVC = self.myHomeContainer{
            conVC.swapToview(identifier : segToForYou)
        }
        self.selectMode(mode: .Two)

        
    }
    
    @IBAction func tapProfile(_ sender: UIButton) {
        if let conVC = self.myHomeContainer{
            conVC.swapToview(identifier : segToProfile)
        }
        self.selectMode(mode: .Three)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnHotDeal.tag = ModeDisplay.One.rawValue
        self.btnForYou.tag = ModeDisplay.Two.rawValue
        self.btnProfile.tag = ModeDisplay.Three.rawValue
        self.view.clipsToBounds = true
        self.selectMode(mode: ModeDisplay.One)
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segHomeContainer" {
            self.myHomeContainer = segue.destination as? HomeContainerVC
        }
    }
    func selectMode(mode:ModeDisplay) {
        switch mode {
        case .One:
            self.btnHotDeal.setTitle("Hot Deal", for: UIControlState.normal)
            break
        case .Two:
            self.btnForYou.setTitle("For You", for: UIControlState.normal)
            break
        case .Three:
            self.btnProfile.setTitle("Profile", for: UIControlState.normal)
            break
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
