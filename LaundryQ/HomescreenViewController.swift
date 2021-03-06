import UIKit
import CoreData

var laundryList = [Laundry]()

// class HomescreenViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewController {
class HomescreenViewController: UIViewController, NSFetchedResultsControllerDelegate {

    var firstLoad = true
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    private let persistentContainer = NSPersistentContainer(name: "Laundry")
//
//    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Laundry> = {
//        // Create Fetch Request
//        let fetchRequest: NSFetchRequest<Laundry> = Laundry.fetchRequest()
//
//        // Configure Fetch Request
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: true)]
//
//        // Create Fetched Results Controller
//        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
//
//        // Configure Fetched Results Controller
//        fetchedResultsController.delegate = self
//
//        return fetchedResultsController
//    }()
    
    @IBOutlet weak var LaundryTableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func deleteAllAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Laundry")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try context.fetch(fetchRequest)
            for managedObject in results {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                context.delete(managedObjectData)
                try context.save()
            }
        } catch let error as NSError {
            print("Detele all data error")
        }
    }

    
    private func setupMessageLabel() {
        messageLabel.text = "You don't have any laundry yet."
    }

    private func updateView() {
        var hasLaundry = false
        
        if laundryList.count > 0 {
            hasLaundry = true
        }

        LaundryTableView.isHidden = !hasLaundry
        messageLabel.isHidden = hasLaundry
        
        LaundryTableView.reloadData()
    }

    private func setupView() {
        setupMessageLabel()

        updateView()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LaundryTableView.dataSource = self
        LaundryTableView.separatorStyle = .none
        
//        // untuk debugging
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "Laundry", in: context)
//
//        let abcLaundry = Laundry(entity: entity!, insertInto: context)
//        abcLaundry.laundryName = "AAA"
//        abcLaundry.startDate = Date()
//        abcLaundry.endDate = Date()
//        abcLaundry.status = "On Progress"
        
//        do {
//            try context.save()
//            laundryList.append(abcLaundry)
//        }
//        catch {
//            // error
//            print("context save error")
//        }
        
        if firstLoad {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Laundry")
            request.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: false)]
            
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let laundry = result as! Laundry
                    laundryList.append(laundry)
                }
            }
            catch {
                print("Fetch failed.")
            }
        }
        
        self.setupView()
        
        print("LaundryList", laundryList)
        
//        persistentContainer.loadPersistentStores {
//            (persistentStoreDescription, error) in
//            if let error = error {
//                print("Unable to Load Persistent Store")
//                print("\(error), \(error.localizedDescription)")
//            }
//            else {
//                self.setupView()
//
//                do {
//                    try self.fetchedResultsController.performFetch()
//                } catch {
//                    let fetchError = error as NSError
//                    print("Unable to Perform Fetch Request")
//                    print("\(fetchError), \(fetchError.localizedDescription)")
//                }
//                self.updateView()
//            }
//        }

        // Do any additional setup after loading the view.
    }
    
//    func getAllLaundry() {
//        do {
//            let laundrys = try context.fetch(Laundry.fetchRequest())
//        }
//        catch {
//            // error
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyy"
        return dateFormatter.string(from: date)
    }

}

extension HomescreenViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laundryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LaundryTableView.dequeueReusableCell(withIdentifier: "LaundryHistoryCell", for: indexPath) as! LaundryTableViewCell
        
        let laundry: Laundry!
        laundry = laundryList[indexPath.row]
        print("nih mau render laundry:", laundry)
        
        cell.LaundryName.text = laundry.laundryName
//        cell.LaundryTime.text = "\(laundry.startDate!) - \(laundry.endDate!)"
        cell.LaundryTime.text = formatDate(date: laundry.startDate!) + " - " + formatDate(date: laundry.endDate!)
        cell.LaundryStatus.text = laundry.status
        cell.LaundryItemCount.text = "\(laundry.items!.count)"
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupView()
        
        LaundryTableView.reloadData()
    }
}
