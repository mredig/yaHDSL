#if canImport(Foundation)
import Foundation
#endif

public struct Blockquote: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Blockquote {
	func withCitation(_ source: String) -> Self {
		setAttribute(named: .cite, value: source)
	}

	#if canImport(Foundation)
	func withCitation(_ url: URL) -> Self {
		setAttribute(named: .cite, value: url.absoluteString)
	}
	#endif
}

public extension AttributeName {
	static let cite = AttributeName(rawValue: "cite")!
}
