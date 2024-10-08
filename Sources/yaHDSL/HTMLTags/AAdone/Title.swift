public struct Title: HTMLTextContainer, EventAttributable {
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public var text: String

	public init(_ text: String) {
		self.text = text
	}
}
