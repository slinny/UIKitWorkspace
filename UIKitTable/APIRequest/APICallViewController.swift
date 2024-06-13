import UIKit

class APICallViewController: UIViewController {
    
    var records: [Result] = []
    @IBOutlet weak var recordTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        fetchData()
    }
}

extension APICallViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = recordTable.dequeueReusableCell(withIdentifier: "RecordTableViewCell") as? RecordTableViewCell else { return RecordTableViewCell()}
        
        cell.artistLabel.text = records[indexPath.row].artistName
        cell.countryLabel.text = records[indexPath.row].country.rawValue
        cell.priceLabel.text = records[indexPath.row].collectionPrice.description
        cell.genreLabel.text = records[indexPath.row].primaryGenreName
        
        return cell
    }
}

extension APICallViewController {
    fileprivate func setupTable() {
        recordTable.register(UINib(nibName: "RecordTableViewCell", bundle: nil), forCellReuseIdentifier: "RecordTableViewCell")
        recordTable.dataSource = self
    }
    
    fileprivate func fetchData() {
        APIManager.shared.getDataFromServer(url: "https://itunes.apple.com/search?term=a") { data in
            guard let serverData = data else {
                return
            }
            
            if let apiResponse = try? JSONDecoder().decode(RecordModel.self, from: serverData) {
                DispatchQueue.main.async {
                    self.records = apiResponse.results
                    self.recordTable.reloadData()
                }
            }
        }
    }
}

/*
 here is the structure for you app :
 1. model in Model folder

 2. Storyboard and uitableviewcell in View folder

 3. Calling api and fetching the data it should be in Network folder

 4. Viewcontrollers should be in Controller folder

 5. all constants like URL , and other details which may include screen title and button title etc needs to be in other folder called Common ( where you can create a Constant file and add all these details )

 Constraints should be applied correctly , no code copy from internet

 whereever possible try to use Enum and no hard coded value is allowed

 appllication name should be : iTuneArtists

 application version : 1.0

 build number should be : 1.0

 bundle identifier should be : com.youname.development.appname
 */
