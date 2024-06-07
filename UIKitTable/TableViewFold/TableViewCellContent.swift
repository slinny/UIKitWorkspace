//
//  TableViewCellContent.swift
//  UIKitTable
//
//  Created by Siran Li on 5/30/24.
//

import UIKit

class TableViewCellContent: UITableViewCell {
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var tickView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tickView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        tickView.isHidden = !selected
    }
    
}
