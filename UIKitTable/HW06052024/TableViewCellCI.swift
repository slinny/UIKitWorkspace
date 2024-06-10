import UIKit

class TableViewCellCI: UITableViewCell {
    
    @IBOutlet weak var checkbutton: UIButton!
    @IBOutlet weak var checkItemLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var rightImageView: UIImageView!
    
    weak var delegate: TableCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        delegate?.didTapCheckButton(self)
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        delegate?.didTapInfoButton(self)
    }
}

protocol TableCellDelegate: AnyObject {
    func didTapCheckButton(_ cell: TableViewCellCI)
    func didTapInfoButton(_ cell: TableViewCellCI)
}
