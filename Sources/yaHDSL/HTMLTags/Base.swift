#if canImport(Foundation)
import Foundation
#endif

public struct Base: HTMLSoloNode, GlobalAttributable, EventAttributable {
	public var tag: String? { "base" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?


	public init() {}
	public init(attributes: [AttributeName: AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}

public extension Base {
	func withHref(_ value: String) -> Self {
		setAttribute(named: .href, value: value)
	}

	#if canImport(Foundation)
	func withHref(_ url: URL) -> Self {
		setAttribute(named: .href, value: url.absoluteString)
	}
	#endif

	typealias Target = A.Target
	func withTarget(_ target: Target) -> Self {
		setAttribute(named: .target, value: target)
	}
}
