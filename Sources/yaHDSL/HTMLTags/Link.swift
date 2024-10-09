#if canImport(Foundation)
import Foundation
#endif
#if canImport(CryptoKit)
import CryptoKit
#elseif canImport(Crypto)
import Crypto
#endif

public struct Link: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "link" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	
	#if canImport(Foundation)
	public init(
		href: URL? = nil,
		rel: Relationship? = nil,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.init(
			href: href?.absoluteString,
			rel: rel,
			attributes: attributes,
			attributesOptions: attributesOptions)
	}
	#endif

	public init(
		href: String? = nil,
		rel: Relationship? = nil,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
		if let href {
			self = withHref(href)
		}
		if let rel {
			self = withRel(rel)
		}
	}
}

public extension Link {
	struct LinkType: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let audio = LinkType(rawValue: "audio")
		public static let document = LinkType(rawValue: "document")
		public static let embed = LinkType(rawValue: "embed")
		public static let fetch = LinkType(rawValue: "fetch")
		public static let font = LinkType(rawValue: "font")
		public static let image = LinkType(rawValue: "image")
		public static let object = LinkType(rawValue: "object")
		public static let script = LinkType(rawValue: "script")
		public static let style = LinkType(rawValue: "style")
		public static let track = LinkType(rawValue: "track")
		public static let video = LinkType(rawValue: "video")
		public static let worker = LinkType(rawValue: "worker")
	}
	func withAs(_ linkType: LinkType) -> Self {
		setAttribute(named: .as, value: linkType)
	}

	typealias CrossOriginPolicy = Img.CrossOriginPolicy
	func withCrossOrigin(_ policy: CrossOriginPolicy) -> Self {
		setAttribute(named: .crossorigin, value: policy)
	}

	func withDisabled(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .disabled)
		} else {
			removeAttribute(named: .disabled)
		}
	}

	typealias FetchPriority = Img.FetchPriority
	func withFetchPriority(_ priority: FetchPriority) -> Self {
		setAttribute(named: .fetchpriority, value: priority)
	}

	func withHref(_ url: String) -> Self {
		setAttribute(named: .href, value: url)
	}

	#if canImport(Foundation)
	func withHref(_ url: URL) -> Self {
		setAttribute(named: .href, value: url.absoluteString)
	}
	#endif

	/// [Code info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#hreflang)
	func withHrefLang(_ langCode: String) -> Self {
		setAttribute(named: .hreflang, value: langCode)
	}

	/// [Details](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#imagesizes)
	func withImageSizes(_ value: String) -> Self {
		setAttribute(named: .imagesizes, value: value)
	}

	/// [Details](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link#imagesrcset)
	func withImageSrcSet(_ value: String) -> Self {
		setAttribute(named: .imagesrcset, value: value)
	}

	func withIntegrity(_ b64: String) -> Self {
		setAttribute(named: .integrity, value: b64)
	}

	func withIntegrity(_ hash: Data) -> Self {
		setAttribute(named: .integrity, value: .b64Data(hash, options: []))
	}

	#if canImport(Crypto) || canImport(CryptoKit)
	@available(macOS 10.15, *)
	func withIntegrity(_ hash: SHA256.Digest) -> Self {
		let b64data = Data(hash).base64EncodedString()
		return withIntegrity("sha256-\(b64data)")
	}

	@available(macOS 10.15, *)
	func withIntegrity(_ hash: SHA384.Digest) -> Self {
		let b64data = Data(hash).base64EncodedString()
		return withIntegrity("sha384-\(b64data)")
	}

	@available(macOS 10.15, *)
	func withIntegrity(_ hash: SHA512.Digest) -> Self {
		let b64data = Data(hash).base64EncodedString()
		return withIntegrity("sha512-\(b64data)")
	}
	#endif

	func withMedia(_ mediaQuery: String) -> Self {
		setAttribute(named: .media, value: mediaQuery)
	}

	typealias ReferrerPolicy = A.ReferrerPolicy
	func withReferrerPolicy(_ policy: ReferrerPolicy) -> Self {
		setAttribute(named: .referrerpolicy, value: policy)
	}

	func withRel(_ relationship: Relationship) -> Self {
		setAttribute(named: .rel, value: relationship)
	}

	func withSizes(_ sizes: [String]) -> Self {
		setAttribute(named: .sizes, value: .list(sizes))
	}

	func withType(_ mimeType: String) -> Self {
		setAttribute(named: .type, value: mimeType)
	}
}
