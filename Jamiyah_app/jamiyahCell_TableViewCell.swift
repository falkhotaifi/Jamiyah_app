//
//  jamiyahCell_TableViewCell.swift
//  Jamiyah_app
//
//  Created by Faisal Alkhotaifi on 5/26/17.
//  Copyright © 2017 F3Deve. All rights reserved.
//

import UIKit

class jamiyahCell_TableViewCell: UITableViewCell {
    @IBOutlet weak var backgndView: UIView!
    @IBOutlet weak var jamiyahName: UILabel!
    @IBOutlet weak var shareAmount: UILabel!
    @IBOutlet weak var jamiyahIcom: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgndView.layer.cornerRadius = 5.0
        backgndView.layer.masksToBounds = false
        backgndView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
