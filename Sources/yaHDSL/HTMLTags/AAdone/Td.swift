public struct Td: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Td {
	func withColSpan(_ span: Int) -> Self {
		setAttribute(named: .colspan, value: span)
	}

	func withHeaders(_ headerIDs: [String]) -> Self {
		setAttribute(named: .headers, value: .list(headerIDs))
	}

	func withRowSpan(_ span: Int) -> Self {
		setAttribute(named: .rowspan, value: span)
	}
}
