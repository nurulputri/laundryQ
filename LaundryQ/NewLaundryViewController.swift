import UIKit
import CoreData

class NewLaundryViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Laundry"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var laundryName: UITextField!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    
    @IBAction func saveAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Laundry", in: context)
        let newLaundry = Laundry(entity: entity!, insertInto: context)
        
//        let newLaundry = Laundry(context: context)
        newLaundry.laundryName = laundryName.text
        newLaundry.startDate = startDate.date
        newLaundry.endDate = endDate.date
        newLaundry.status = "On Progress"
        
        do {
            try context.save()
            laundryList.append(newLaundry)
            navigationController?.popViewController(animated: true)
        }
        catch {
            // error
            print("context save error")
        }
    }
    
//    func createLaundry(laundryName: String, startDate: Date, endDate: Date) {
//        // initial status must be "On Progress"
//        let newLaundry = Laundry(context: context)
//        newLaundry.laundryName = laundryName
//        newLaundry.startDate = startDate
//        newLaundry.endDate = endDate
//        newLaundry.status = "On Progress"
//
//        do {
//            try context.save()
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

}
