import Foundation
import CoreData


extension LaundryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LaundryItem> {
        return NSFetchRequest<LaundryItem>(entityName: "LaundryItem")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var img: Data?
    @NSManaged public var laundry: Laundry?

}

extension LaundryItem : Identifiable {

}
