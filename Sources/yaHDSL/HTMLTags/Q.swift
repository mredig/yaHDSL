#if canImport(Foundation)
import Foundation
#endif

public struct Q: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Q {
	func withCitation(_ url: String) -> Self {
		setAttribute(named: .cite, value: url)
	}

	#if canImport(Foundation)
	func withCitation(_ url: URL) -> Self {
		setAttribute(named: .cite, value: url.absoluteString)
	}
	#endif
}
