public struct Option: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Option {
	func withDisabled(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .disabled)
		} else {
			removeAttribute(named: .disabled)
		}
	}

	func withLabel(_ label: String) -> Self {
		setAttribute(named: .label, value: label)
	}

	func withSelected(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .selected)
		} else {
			removeAttribute(named: .selected)
		}
	}

	func withValue(_ value: Int) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: String) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: Double) -> Self {
		setAttribute(named: .value, value: value)
	}

	func withValue(_ value: AttributeValue) -> Self {
		setAttribute(named: .value, value: value)
	}
}
