public struct Meter: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Meter {
	func withValue(_ value: Int) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withMin(_ value: Int) -> Self {
		setAttribute(named: .min, value: value)
	}

	func withMax(_ value: Int) -> Self {
		setAttribute(named: .max, value: value)
	}

	func withLow(_ value: Int) -> Self {
		setAttribute(named: .low, value: value)
	}

	func withHigh(_ value: Int) -> Self {
		setAttribute(named: .high, value: value)
	}

	func withOptimum(_ value: Int) -> Self {
		setAttribute(named: .optimum, value: value)
	}

	func withForm(_ formID: String) -> Self {
		setAttribute(named: .form, value: formID)
	}
}
