public struct Progress: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Progress {
	func withMax(_ value: Double) -> Self {
		setAttribute(named: .max, value: value)
	}

	func withValue(_ value: Double) -> Self {
		setAttribute(named: .value, value: value)
	}
}
