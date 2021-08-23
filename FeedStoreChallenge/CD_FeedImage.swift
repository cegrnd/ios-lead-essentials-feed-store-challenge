//
//

import Foundation
import CoreData

@objc(CD_FeedImage)
public class CD_FeedImage: NSManagedObject {}

extension CD_FeedImage {

	@NSManaged public var id: UUID?
	@NSManaged public var imageDescription: String?
	@NSManaged public var location: String?
	@NSManaged public var url: URL?
	@NSManaged public var cache: CD_Cache?
}

extension CD_FeedImage: Identifiable {}

extension CD_FeedImage {
	internal static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map { local in
			let feedImage = CD_FeedImage(context: context)
			feedImage.id = local.id
			feedImage.imageDescription = local.description
			feedImage.location = local.location
			feedImage.url = local.url
			return feedImage
		})
	}
	
	internal var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}
}
