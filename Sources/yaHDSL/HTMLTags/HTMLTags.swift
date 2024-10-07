public struct HTML: HTMLContainerNode {
	public var childNodes: [any HTMLNode]
	public var attributes: [String: AttributeValue] = [:]

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public struct Head: HTMLContainerNode {
	public var childNodes: [any HTMLNode]
	public var attributes: [String: AttributeValue] = [:]

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public struct Body: HTMLContainerNode, ClassAttributable, IDAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [String: AttributeValue] = [:]

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public struct Div: HTMLContainerNode {
	public var childNodes: [any HTMLNode]
	public var attributes: [String: AttributeValue] = [:]

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}
