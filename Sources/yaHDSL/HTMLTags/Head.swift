public struct Head: HTMLContainerNode, GlobalAttributes {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}
