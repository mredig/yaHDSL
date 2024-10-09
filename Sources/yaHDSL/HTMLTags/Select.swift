public struct Select: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Select {
	typealias AutoCompleteMode = Input.AutoCompleteMode
	func withAutoComplete(_ mode: AutoCompleteMode) -> Self {
		setAttribute(named: .autocomplete, value: mode)
	}

	func withDisabled(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .disabled)
		} else {
			removeAttribute(named: .disabled)
		}
	}

	func withForm(_ formID: String) -> Self {
		setAttribute(named: .form, value: formID)
	}

	func withMultiple(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .multiple)
		} else {
			removeAttribute(named: .multiple)
		}
	}

	func withName(_ value: String) -> Self {
		setAttribute(named: .name, value: value)
	}

	func withRequired(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .required)
		} else {
			removeAttribute(named: .required)
		}
	}

	func withSize(_ value: UInt) -> Self {
		setAttribute(named: .size, value: value)
	}
}
