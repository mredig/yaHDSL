#if canImport(Foundation)
import Foundation
#endif

public struct Ins: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Ins {
	func withCitation(_ url: String) -> Self {
		setAttribute(named: .cite, value: url)
	}

	#if canImport(Foundation)
	func withCitation(_ url: URL) -> Self {
		setAttribute(named: .cite, value: url.absoluteString)
	}
	#endif

	nonisolated(unsafe) package static let dateFormatter = Del.dateFormatter
	func withDateTime(_ timestamp: Date) -> Self {
		setAttribute(named: .datetime, value: Self.dateFormatter.string(from: timestamp))
	}
}
