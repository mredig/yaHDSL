public struct Relationship: RawRepresentable, Sendable, Hashable {
	public var rawValue: String
	public init(rawValue: String) {
		self.rawValue = rawValue
	}

	public enum Link {
		public static let alternate = Relationship(rawValue: "alternate")
		public static let author = Relationship(rawValue: "author")
		public static let canonical = Relationship(rawValue: "canonical")
		public static let dnsPrefetch = Relationship(rawValue: "dns-prefetch")
		public static let expect = Relationship(rawValue: "expect")
		public static let help = Relationship(rawValue: "help")
		public static let icon = Relationship(rawValue: "icon")
		public static let license = Relationship(rawValue: "license")
		public static let manifest = Relationship(rawValue: "manifest")
		public static let me = Relationship(rawValue: "me")
		public static let modulepreload = Relationship(rawValue: "modulepreload")
		public static let next = Relationship(rawValue: "next")
		public static let pingback = Relationship(rawValue: "pingback")
		public static let preconnect = Relationship(rawValue: "preconnect")
		public static let prefetch = Relationship(rawValue: "prefetch")
		public static let preload = Relationship(rawValue: "preload")
		public static let prerender = Relationship(rawValue: "prerender")
		public static let prev = Relationship(rawValue: "prev")
		public static let privacyPolicy = Relationship(rawValue: "privacy-policy")
		public static let search = Relationship(rawValue: "search")
		public static let stylesheet = Relationship(rawValue: "stylesheet")
		public static let termsOfService = Relationship(rawValue: "terms-of-service")
	}

	public enum A {
		public static let alternate = Relationship(rawValue: "alternate")
		public static let author = Relationship(rawValue: "author")
		public static let bookmark = Relationship(rawValue: "bookmark")
		public static let external = Relationship(rawValue: "external")
		public static let help = Relationship(rawValue: "help")
		public static let license = Relationship(rawValue: "license")
		public static let me = Relationship(rawValue: "me")
		public static let next = Relationship(rawValue: "next")
		public static let nofollow = Relationship(rawValue: "nofollow")
		public static let noopener = Relationship(rawValue: "noopener")
		public static let noreferrer = Relationship(rawValue: "noreferrer")
		public static let opener = Relationship(rawValue: "opener")
		public static let prev = Relationship(rawValue: "prev")
		public static let privacyPolicy = Relationship(rawValue: "privacy-policy")
		public static let search = Relationship(rawValue: "search")
		public static let tag = Relationship(rawValue: "tag")
		public static let termsOfService = Relationship(rawValue: "terms-of-service")
	}
	typealias Area = A
	public enum Form {
		public static let external = Relationship(rawValue: "external")
		public static let expect = Relationship(rawValue: "expect")
		public static let help = Relationship(rawValue: "help")
		public static let license = Relationship(rawValue: "license")
		public static let next = Relationship(rawValue: "next")
		public static let nofollow = Relationship(rawValue: "nofollow")
		public static let noopener = Relationship(rawValue: "noopener")
		public static let noreferrer = Relationship(rawValue: "noreferrer")
		public static let opener = Relationship(rawValue: "opener")
		public static let prev = Relationship(rawValue: "prev")
		public static let search = Relationship(rawValue: "search")
	}
}
