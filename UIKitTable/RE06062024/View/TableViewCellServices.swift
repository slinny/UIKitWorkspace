import UIKit

class TableViewCellServices: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TableViewCellServices: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellServices", for: indexPath) as? CollectionViewCellServices else { return CollectionViewCellServices() }
        
        cell.serviceImageView.image = UIImage(systemName: DataRE.services[indexPath.row].imageName)
        cell.serviceLabel.text = DataRE.services[indexPath.row].title
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.systemGray.cgColor
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = false
        
        return cell
    }
}
