//
//  PaymentTableViewCell.swift
//  Homework-iOS
//
//  Created by Admin on 5/8/21.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var pImgView: ImageLoader!
    @IBOutlet weak var pNameLb: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
