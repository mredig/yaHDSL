public protocol HeadProtocol: HTMLNode {}
public struct Head: HeadProtocol, HTMLContentElement, GlobalAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(title: String) {
		self.init(title: title) { }
	}

	public init(title: String, @HTMLContainerNodeBuilder _ builder: () -> Head) {
		self = builder()
		let title = Title(title)
		addChildNode(title)
	}

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}
