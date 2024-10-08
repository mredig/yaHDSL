public struct Output: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Output {
	func withFor(_ otherElementIDs: [String]) -> Self {
		setAttribute(named: .for, value: .list(otherElementIDs))
	}

	func withForm(_ formID: String) -> Self {
		setAttribute(named: .form, value: formID)
	}

	func withName(_ value: String) -> Self {
		setAttribute(named: .name, value: value)
	}
}
