public struct Body: HTMLContainerNode {
	public var childNodes: [any HTMLNode]
	public var attributes: [String: AttributeValue] = [:]

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}
