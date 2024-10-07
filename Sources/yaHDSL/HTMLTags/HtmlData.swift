public struct HtmlData: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "data" }
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension HtmlData {
	func withValue(_ value: Int) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: String) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: Double) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: AttributeValue) -> Self {
		setAttribute(named: .value, value: value)
	}
}
