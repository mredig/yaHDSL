public struct Wbr: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "wbr" }

	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	init(attributes: [AttributeName : AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}
