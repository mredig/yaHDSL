public struct Div: HTMLContainerNode {
	public var childNodes: [any HTMLNode]

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}
