public struct Bdo: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(dir: TextDirection, @HTMLContainerNodeBuilder builder: () -> Bdo) {
		self = builder()
		self = withDir(dir)
	}

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
		self = withDir(.ltr)
	}
}

public extension Bdo {
	func withDir(_ dir: TextDirection) -> Self {
		setAttribute(named: .dir, value: dir)
	}
}
