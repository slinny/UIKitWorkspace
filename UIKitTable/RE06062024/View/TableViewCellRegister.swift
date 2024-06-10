import UIKit

class TableViewCellRegister: UITableViewCell {
    
    @IBOutlet weak var getStartedButton: UIButton!
    weak var delegate: GetStartedButtonDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 8.0
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
    
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        delegate?.didTapGetStartedButton(in: self)
    }
}

protocol GetStartedButtonDelegate: AnyObject {
    func didTapGetStartedButton(in cell: UITableViewCell)
}
