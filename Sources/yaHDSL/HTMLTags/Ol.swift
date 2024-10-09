public struct Ol: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Ol {
	func withReversed(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .reversed)
		} else {
			removeAttribute(named: .reversed)
		}
	}

	func withStart(_ value: Int) -> Self {
		setAttribute(named: .start, value: value)
	}

	struct OrderedListType: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let lowercaseLetters = OrderedListType(rawValue: "a")
		public static let uppercaseLetters = OrderedListType(rawValue: "A")
		public static let lowercaseRomanNumerals = OrderedListType(rawValue: "i")
		public static let uppercaseRomanNumerals = OrderedListType(rawValue: "I")
		public static let numbers = OrderedListType(rawValue: "1")
	}
	func withType(_ type: OrderedListType) -> Self {
		setAttribute(named: .type, value: type)
	}
}
