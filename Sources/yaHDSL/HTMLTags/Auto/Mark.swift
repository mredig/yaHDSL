public struct Mark: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?
	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}