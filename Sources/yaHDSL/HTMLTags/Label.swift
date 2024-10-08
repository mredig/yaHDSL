public struct Label: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(forInputID inputID: String, content: String) {
		self.init(forInputID: inputID) { content }
	}

	public init(forInputID inputID: String, @HTMLContainerNodeBuilder _ builder: () -> Label) {
		self = builder()
		self = self.for(inputID)
	}

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Label {
	func `for`(_ inputID: String) -> Self {
		setAttribute(named: .for, value: inputID)
	}
}
