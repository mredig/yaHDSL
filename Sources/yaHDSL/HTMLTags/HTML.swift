public struct HTML: HTMLContentElement, GlobalAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(lang: String, @HTMLContainerNodeBuilder _ builder: () -> HTML) {
		self = builder()
			.setLang(lang)
	}

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension HTML {
	func withXmlns(_ ns: String) -> Self {
		setAttribute(named: .xmlns, value: ns)
	}
}
