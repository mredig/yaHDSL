public struct Br: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "br" }

	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	public init(attributes: [AttributeName: AttributeValue]) {
		self.attributes = attributes
	}
}
