public struct H1: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(_ text: String) {
		self = Self { text }
	}

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}
