public struct Style: HTMLTextContainer, GlobalAttributable, EventAttributable {
	public var tag: String? { "style" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public var text: String

	public init(_ text: String) {
		self.text = text
	}

	public init(
		text: String,
		attributes: [AttributeName: AttributeValue] = [:],
		attributesOptions: AttributesOptions? = nil
	) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
		self.text = text
	}
}

public extension Style {
	func withMedia(_ mediaQuery: String) -> Self {
		setAttribute(named: .media, value: mediaQuery)
	}

	func withNonce(_ nonce: String) -> Self {
		setAttribute(named: .nonce, value: nonce)
	}
}
