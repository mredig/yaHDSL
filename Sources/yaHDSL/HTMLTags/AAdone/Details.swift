public struct Details: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Details {
	func withOpen(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .open)
		} else {
			removeAttribute(named: .open)
		}
	}

	func withName(_ name: String) -> Self {
		setAttribute(named: .name, value: name)
	}
}
