public struct Col: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "col" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	public init(attributes: [AttributeName : AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}

public extension Col {
	func withSpan(_ columnCount: Int) -> Self {
		setAttribute(named: .span, value: columnCount)
	}
}
