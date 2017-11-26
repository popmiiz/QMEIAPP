//
//  ListTableViewCell.swift
//  Qrproject
//
//  Created by Suphawat on 1/11/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var contLabel: UILabel!
    @IBOutlet weak var nameResLabel: UILabel!
    @IBOutlet weak var kilomateLabel: UILabel!
    @IBOutlet weak var iconloView: UIImageView!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
