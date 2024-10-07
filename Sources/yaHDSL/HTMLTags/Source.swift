#if canImport(Foundation)
import Foundation
#endif

public struct Source: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "source" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	init(attributes: [AttributeName: AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}

public extension Source {
	func withMedia(_ mediaQuery: String) -> Self {
		setAttribute(named: .media, value: mediaQuery)
	}

	func withSizes(_ value: String) -> Self {
		setAttribute(named: .sizes, value: value)
	}

	func withSrc(_ value: String) -> Self {
		setAttribute(named: .src, value: value)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif

	func withSrcSet(_ value: String) -> Self {
		setAttribute(named: .srcset, value: value)
	}

	#if canImport(Foundation)
	func withSrcSet(_ url: URL) -> Self {
		setAttribute(named: .srcset, value: url.absoluteString)
	}
	#endif

	func withType(_ mimeType: String) -> Self {
		setAttribute(named: .type, value: mimeType)
	}
}
