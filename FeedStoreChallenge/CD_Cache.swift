
import Foundation
import CoreData

@objc(CD_Cache)
final class CD_Cache: NSManagedObject {}

extension CD_Cache {
	@NSManaged var timestamp: Date
	@NSManaged var feed: NSOrderedSet
}

extension CD_Cache {
	static func find(in context: NSManagedObjectContext) throws -> CD_Cache? {
		let request = NSFetchRequest<CD_Cache>(entityName: entity().name!)
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	static func newUniqueInstance(in context: NSManagedObjectContext) throws -> CD_Cache {
		try find(in: context).map(context.delete)
		return CD_Cache(context: context)
	}

	var localFeed: [LocalFeedImage] {
		return feed.compactMap { ($0 as? CD_FeedImage)?.local }
	}
}
