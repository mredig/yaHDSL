public struct Fieldset: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Fieldset {
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

	func withName(_ name: String) -> Self {
		setAttribute(named: .name, value: name)
	}
}
