#if canImport(Foundation)
import Foundation
#endif

public struct Del: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Del {
	func withCitation(_ url: String) -> Self {
		setAttribute(named: .cite, value: url)
	}

	#if canImport(Foundation)
	func withCitation(_ url: URL) -> Self {
		setAttribute(named: .cite, value: url.absoluteString)
	}

	func withDatetime(_ timestamp: Date) -> Self {
		withDatetime(ISO8601DateFormatter.internetTime.string(from: timestamp))
	}
	#endif

	func withDatetime(_ value: String) -> Self {
		setAttribute(named: .datetime, value: value)
	}
}
