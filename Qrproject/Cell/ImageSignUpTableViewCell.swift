//
//  ImageSignUpTableViewCell.swift
//  Qrproject
//
//  Created by popmiiz on 10/25/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//

import UIKit

class ImageSignUpTableViewCell: UITableViewCell {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var btnImage: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
