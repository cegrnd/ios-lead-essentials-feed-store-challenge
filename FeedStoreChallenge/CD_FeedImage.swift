//
//

import Foundation
import CoreData


@objc(CD_FeedImage)
public class CD_FeedImage: NSManagedObject {

}

extension CD_FeedImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_FeedImage> {
        return NSFetchRequest<CD_FeedImage>(entityName: "CD_FeedImage")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageDescription: String?
    @NSManaged public var location: String?
    @NSManaged public var url: URL?
    @NSManaged public var cache: CD_Cache?

}

extension CD_FeedImage : Identifiable {

}
