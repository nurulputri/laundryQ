import Foundation
import CoreData


extension Laundry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Laundry> {
        return NSFetchRequest<Laundry>(entityName: "Laundry")
    }

    @NSManaged public var laundryName: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var status: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Laundry {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: LaundryItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: LaundryItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Laundry : Identifiable {

}
