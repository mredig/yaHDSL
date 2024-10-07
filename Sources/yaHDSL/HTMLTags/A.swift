#if canImport(Foundation)
import Foundation
#endif

public struct A: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension A {
	func withHref(_ url: String) -> Self {
		setAttribute(named: .href, value: url)
	}

	#if canImport(Foundation)
	func withHref(_ url: URL) -> Self {
		setAttribute(named: .href, value: url.absoluteString)
	}
	#endif

	func withDownload(_ filename: String) -> Self {
		setAttribute(named: .download, value: filename)
	}

	func withHrefLang(_ langCode: String) -> Self {
		setAttribute(named: .hreflang, value: langCode)
	}

	func withPing(_ urlList: [String]) -> Self {
		setAttribute(named: .ping, value: .list(urlList))
	}

	struct ReferrerPolicy: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let noReferrer = ReferrerPolicy(rawValue: "no-referrer")
		public static let noReferrerWhenDowngrade = ReferrerPolicy(rawValue: "no-referrer-when-downgrade")
		public static let origin = ReferrerPolicy(rawValue: "origin")
		public static let originWhenCrossOrigin = ReferrerPolicy(rawValue: "origin-when-cross-origin")
		public static let sameOrigin = ReferrerPolicy(rawValue: "same-origin")
		public static let strictOriginWhenCrossOrigin = ReferrerPolicy(rawValue: "strict-origin-when-cross-origin")
		public static let unsafeUrl = ReferrerPolicy(rawValue: "unsafe-url")
	}

	func withReferrerPolicy(_ policy: ReferrerPolicy) -> Self {
		setAttribute(named: .referrerpolicy, value: policy.rawValue)
	}

	struct Relationship: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let alternate = Relationship(rawValue: "alternate")
		public static let author = Relationship(rawValue: "author")
		public static let bookmark = Relationship(rawValue: "bookmark")
		public static let external = Relationship(rawValue: "external")
		public static let help = Relationship(rawValue: "help")
		public static let license = Relationship(rawValue: "license")
		public static let next = Relationship(rawValue: "next")
		public static let nofollow = Relationship(rawValue: "nofollow")
		public static let noreferrer = Relationship(rawValue: "noreferrer")
		public static let noopener = Relationship(rawValue: "noopener")
		public static let prev = Relationship(rawValue: "prev")
		public static let search = Relationship(rawValue: "search")
		public static let tag = Relationship(rawValue: "tag")
	}

	func withRelationship(_ rel: Relationship) -> Self {
		setAttribute(named: .rel, value: rel.rawValue)
	}

	struct Target: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let blank = Target(rawValue: "_blank")
		public static let parent = Target(rawValue: "_parent")
		public static let `self` = Target(rawValue: "_self")
		public static let top = Target(rawValue: "_top")
	}

	func withTarget(_ target: Target) -> Self {
		setAttribute(named: .target, value: target.rawValue)
	}

	func withType(_ mediaType: String) -> Self {
		setAttribute(named: .type, value: mediaType)
	}
}

public extension AttributeName {
	static let href = try! AttributeName("href")
	static let download = try! AttributeName("download")
	static let hreflang = try! AttributeName("hreflang")
	static let ping = try! AttributeName("ping")
	static let referrerpolicy = try! AttributeName("referrerpolicy")
	static let rel = try! AttributeName("rel")
	static let target = try! AttributeName("target")
	static let type = try! AttributeName("type")
}
