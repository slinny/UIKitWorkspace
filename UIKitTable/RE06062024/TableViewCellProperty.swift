import UIKit

class TableViewCellProperty: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

extension TableViewCellProperty: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataRE.properties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellProperty", for: indexPath) as? CollectionViewCellProperty else { return CollectionViewCellProperty() }
        
        cell.propertyThumbnail.image = UIImage(systemName: DataRE.properties[indexPath.row].thumbnail)
        cell.priceLabel.text = "AED \(DataRE.properties[indexPath.row].price)"
        cell.infoLabel.text = "\(DataRE.properties[indexPath.row].numberOfBeds) Bed | \(DataRE.properties[indexPath.row].numberOfBathrooms) Bath"
        cell.addressLabel.text = DataRE.properties[indexPath.row].address
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.systemGray.cgColor
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = false
        
        return cell
    }
}
