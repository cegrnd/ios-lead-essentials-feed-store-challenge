
import Foundation
import CoreData

@objc(CD_FeedImage)
final class CD_FeedImage: NSManagedObject {}

extension CD_FeedImage {
	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: CD_Cache?
}

extension CD_FeedImage {
	static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map { local in
			let feedImage = CD_FeedImage(context: context)
			feedImage.id = local.id
			feedImage.imageDescription = local.description
			feedImage.location = local.location
			feedImage.url = local.url
			return feedImage
		})
	}

	var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}
}
