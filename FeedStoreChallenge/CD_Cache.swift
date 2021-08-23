//
//

import Foundation
import CoreData

@objc(CD_Cache)
public class CD_Cache: NSManagedObject {}

extension CD_Cache {

	@NSManaged public var timestamp: Date?
	@NSManaged public var feed: NSOrderedSet
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

extension CD_Cache: Identifiable {}

extension CD_Cache {
	internal static func find(in context: NSManagedObjectContext) throws -> CD_Cache? {
		let request = NSFetchRequest<CD_Cache>(entityName: entity().name!)
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}
	
	internal static func newUniqueInstance(in context: NSManagedObjectContext) throws -> CD_Cache {
		try find(in: context).map(context.delete)
		return CD_Cache(context: context)
	}
	
	internal var localFeed: [LocalFeedImage] {
		return feed.compactMap { ($0 as? CD_FeedImage)?.local }
	}
}
