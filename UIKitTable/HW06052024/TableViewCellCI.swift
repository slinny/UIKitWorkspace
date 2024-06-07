//
//  TableViewCellCI.swift
//  UIKitTable
//
//  Created by Siran Li on 6/5/24.
//

import UIKit

class TableViewCellCI: UITableViewCell {
    
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var checkItemLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var rightImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addButtonPressed(_ sender: Any) {
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
    }
    

}
