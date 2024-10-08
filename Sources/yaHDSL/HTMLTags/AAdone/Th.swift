public struct Th: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Th {
	func withAbbr(_ value: String) -> Self {
		setAttribute(named: .abbr, value: value)
	}

	func withColSpan(_ value: UInt) -> Self {
		setAttribute(named: .colspan, value: value)
	}

	func withHeaders(_ headerIDs: [String]) -> Self {
		setAttribute(named: .headers, value: .list(headerIDs))
	}

	func withRowSpan(_ value: UInt) -> Self {
		setAttribute(named: .rowspan, value: value)
	}

	struct ScopeValue: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let row = ScopeValue(rawValue: "row")
		public static let col = ScopeValue(rawValue: "col")
		public static let rowgroup = ScopeValue(rawValue: "rowgroup")
		public static let colgroup = ScopeValue(rawValue: "colgroup")
	}
	func withScope(_ value: ScopeValue) -> Self {
		setAttribute(named: .scope, value: value)
	}
}
