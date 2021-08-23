//
//

import Foundation
import CoreData

@objc(CD_Cache)
public class CD_Cache: NSManagedObject {

}

extension CD_Cache {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_Cache> {
        return NSFetchRequest<CD_Cache>(entityName: "CD_Cache")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var feed: NSSet?

}

// MARK: Generated accessors for feed
extension CD_Cache {

    @objc(addFeedObject:)
    @NSManaged public func addToFeed(_ value: CD_FeedImage)

    @objc(removeFeedObject:)
    @NSManaged public func removeFromFeed(_ value: CD_FeedImage)

    @objc(addFeed:)
    @NSManaged public func addToFeed(_ values: NSSet)

    @objc(removeFeed:)
    @NSManaged public func removeFromFeed(_ values: NSSet)

}

extension CD_Cache : Identifiable {

}
