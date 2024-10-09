public struct Dialog: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Dialog {
	func withTabIndex(_ value: Int) -> Self {
		print("Warning 💛: Tab index is unsupported on <dialog> elements. Skipping. https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog#usage_notes")
		return self
	}

	func withOpen(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .open)
		} else {
			removeAttribute(named: .open)
		}
	}
}
