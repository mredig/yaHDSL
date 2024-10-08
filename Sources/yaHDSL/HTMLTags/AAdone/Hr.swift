public struct Hr: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "hr" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	public init(attributes: [AttributeName : AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}
