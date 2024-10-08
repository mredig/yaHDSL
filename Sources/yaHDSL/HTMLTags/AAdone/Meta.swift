public struct Meta: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "meta" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	public init(attributes: [AttributeName : AttributeValue], attributesOptions: AttributesOptions? = nil) {
		self.attributes = attributes
		self.attributesOptions = attributesOptions
	}
}

public extension Meta {
	func withCharset(_ charset: String) -> Self {
		setAttribute(named: .charset, value: charset)
	}

	func withContent(_ content: String) -> Self {
		setAttribute(named: .content, value: content)
	}

	func withContent(_ content: Int) -> Self {
		setAttribute(named: .content, value: content)
	}

	func withContent(_ content: Double) -> Self {
		setAttribute(named: .content, value: content)
	}

	struct HTTPPragmaDirective: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}
		public static let contentSecurityPolicy = HTTPPragmaDirective(rawValue: "content-security-policy")
		public static let contentType = HTTPPragmaDirective(rawValue: "content-type")
		public static let defaultStyle = HTTPPragmaDirective(rawValue: "default-style")
		public static let xUaCompatible = HTTPPragmaDirective(rawValue: "x-ua-compatible")
		public static let refresh = HTTPPragmaDirective(rawValue: "refresh")
	}
	func withHttpEquiv(_ pragma: HTTPPragmaDirective) -> Self {
		setAttribute(named: .httpequiv, value: pragma)
	}

	func withName(_ value: String) -> Self {
		setAttribute(named: .name, value: value)
	}
}

