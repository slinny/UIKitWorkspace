//
//  TableViewCellRegister.swift
//  UIKitTable
//
//  Created by Siran Li on 6/6/24.
//

import UIKit

class TableViewCellRegister: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set up edge properties
        contentView.layer.borderWidth = 0.5 // Width of the border
        contentView.layer.borderColor = UIColor.lightGray.cgColor // Color of the border
        contentView.layer.cornerRadius = 8.0 // Radius of the corners
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
    
}
