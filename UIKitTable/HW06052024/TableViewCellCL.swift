import UIKit

class TableViewCellCL: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var rightImageView: UIImageView!
    
    weak var delegate: TableCellButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        delegate?.didTapButton(in: self)
    }
}

protocol TableCellButtonDelegate: AnyObject {
    func didTapButton(in cell: UITableViewCell)
}
