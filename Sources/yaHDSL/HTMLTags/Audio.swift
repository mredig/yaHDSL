#if canImport(Foundation)
import Foundation
#endif

public struct Audio: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Audio {
	func withAutoplay(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .autoplay)
		} else {
			removeAttribute(named: .autoplay)
		}
	}

	func withControls(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .controls)
		} else {
			removeAttribute(named: .controls)
		}
	}

	func withLoop(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .loop)
		} else {
			removeAttribute(named: .loop)
		}
	}

	func withMuted(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .muted)
		} else {
			removeAttribute(named: .muted)
		}
	}

	struct Preload: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let auto = Preload(rawValue: "auto")
		public static let metadata = Preload(rawValue: "metadata")
		public static let none = Preload(rawValue: "none")
	}
	func withPreload(_ value: Preload) -> Self {
		setAttribute(named: .preload, value: value)
	}

	func withSrc(_ value: String) -> Self {
		setAttribute(named: .src, value: value)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif
}

public extension AttributeName {
	static let autoplay = AttributeName(rawValue: "autoplay")!
	static let controls = AttributeName(rawValue: "controls")!
	static let loop = AttributeName(rawValue: "loop")!
	static let muted = AttributeName(rawValue: "muted")!
	static let preload = AttributeName(rawValue: "preload")!
	static let src = AttributeName(rawValue: "src")!
}
