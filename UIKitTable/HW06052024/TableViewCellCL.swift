import UIKit

class TableViewCellCL: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var rightImageView: UIImageView!
    
    private weak var delegate: TableCellButtonDelegate?
    
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

extension TableViewCellCL {
    func setDelegate(_ delegate: TableCellButtonDelegate?) {
        self.delegate = delegate
    }
}

protocol TableCellButtonDelegate: AnyObject {
    func didTapButton(in cell: UITableViewCell)
}
