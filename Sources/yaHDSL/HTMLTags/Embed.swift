#if canImport(Foundation)
import Foundation
#endif

public struct Embed: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "embed" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	public init(attributes: [AttributeName : AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}

public extension Embed {
	func withHeight(_ height: Int) -> Self {
		setAttribute(named: .height, value: height)
	}

	func withSrc(_ url: String) -> Self {
		setAttribute(named: .src, value: url)
	}

	#if canImport(Foundation)
	func withSrc(_ url: URL) -> Self {
		setAttribute(named: .src, value: url.absoluteString)
	}
	#endif

	func withType(_ mimeType: String) -> Self {
		setAttribute(named: .type, value: mimeType)
	}

	func withWidth(_ width: Int) -> Self {
		setAttribute(named: .width, value: width)
	}
}
