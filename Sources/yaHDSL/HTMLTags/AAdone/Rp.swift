public struct Rp: HTMLTextContainer, EventAttributable {
	public var tag: String? { "rp" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public var text: String

	public init(_ text: String) {
		self.init(text: text)
	}
	public init(
		text: String,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.text = text
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}
