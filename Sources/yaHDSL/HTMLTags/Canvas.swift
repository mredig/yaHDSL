public struct Canvas: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Canvas {
	func withHeight(_ height: Int) -> Self {
		setAttribute(named: .height, value: height)
	}

	func withWidth(_ width: Int) -> Self {
		setAttribute(named: .width, value: width)
	}
}
