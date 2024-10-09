#if canImport(Foundation)
import Foundation
#endif

public struct Track: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "track" }

	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}

	public init(attributes: [AttributeName : AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}

public extension Track {
	func withDefault(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .default)
		} else {
			removeAttribute(named: .default)
		}
	}

	struct Kind: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let subtitles = Kind(rawValue: "subtitles")
		public static let captions = Kind(rawValue: "captions")
		public static let chapters = Kind(rawValue: "chapters")
		public static let metadata = Kind(rawValue: "metadata")
	}
	func withKind(_ kind: Kind) -> Self {
		setAttribute(named: .kind, value: kind)
	}

	func withLabel(_ value: String) -> Self {
		setAttribute(named: .label, value: value)
	}

	func withSrc(_ url: String) -> Self {
		setAttribute(named: .src, value: url)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif

	/// [code info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track#srclang)
	func withSrcLang(_ langCode: String) -> Self {
		setAttribute(named: .srclang, value: langCode)
	}
}
