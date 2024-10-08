#if canImport(Foundation)
import Foundation
#endif

public struct Img: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "img" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	#if canImport(Foundation)
	public init(
		src: URL,
		alt: String,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.init(src: src.absoluteString, alt: alt, attributes: attributes, attributesOptions: attributesOptions)
	}
	#endif

	public init(
		src: String,
		alt: String,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions

		self = withAlt(alt).withSrc(src)
	}
}

public extension Img {
	func withAlt(_ altDescription: String) -> Self {
		setAttribute(named: .alt, value: altDescription)
	}

	struct CrossOriginPolicy: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let anonymous = CrossOriginPolicy(rawValue: "anonymous")
		public static let useCredentials = CrossOriginPolicy(rawValue: "use-credentials")
	}
	func withCrossOrigin(_ policy: CrossOriginPolicy) -> Self {
		setAttribute(named: .crossorigin, value: policy)
	}

	struct DecodeStrategy: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let sync = DecodeStrategy(rawValue: "sync")
		public static let async = DecodeStrategy(rawValue: "async")
		public static let auto = DecodeStrategy(rawValue: "auto")
	}
	func withDecoding(_ strategy: DecodeStrategy) -> Self {
		setAttribute(named: .decoding, value: strategy)
	}

	struct FetchPriority: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let high = FetchPriority(rawValue: "high")
		public static let low = FetchPriority(rawValue: "low")
		public static let auto = FetchPriority(rawValue: "auto")
	}
	func withFetchPriority(_ priority: FetchPriority) -> Self {
		setAttribute(named: .fetchpriority, value: priority)
	}

	func withHeight(_ value: Int) -> Self {
		setAttribute(named: .height, value: value)
	}

	func withIsMap(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .ismap)
		} else {
			removeAttribute(named: .ismap)
		}
	}

	typealias LoadingMode = Iframe.LoadingMode
	func withLoading(_ mode: LoadingMode) -> Self {
		setAttribute(named: .loading, value: mode)
	}

	typealias ReferrerPolicy = A.ReferrerPolicy
	func withReferrerPolicy(_ policy: ReferrerPolicy) -> Self {
		setAttribute(named: .referrerpolicy, value: policy)
	}

	/// [Details](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#sizes)
	func withSizes(_ sizes: [String]) -> Self {
		setAttribute(named: .sizes, value: sizes.joined(separator: ","))
	}

	func withSrc(_ url: String) -> Self {
		setAttribute(named: .src, value: url)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif

	/// [Details](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#srcset)
	func withSrcSet(_ value: String) -> Self {
		setAttribute(named: .srcset, value: value)
	}

	func withWidth(_ value: Int) -> Self {
		setAttribute(named: .width, value: value)
	}

	func withUseMap(_ mapID: String) -> Self {
		let value = {
			if mapID.hasPrefix("#") {
				return mapID
			} else {
				return "#\(mapID)"
			}
		}()
		return setAttribute(named: .usemap, value: value)
	}
}
