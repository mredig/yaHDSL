public struct AnyHTMLNodes: HTMLNode {
	public var tag: String? { nil }

	public var children: [any HTMLNode]

	public init(children: [any HTMLNode]) {
		self.children = children
	}

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		try children
			.map { try $0.render(withContext: context) }
			.joined(separator: "\n")
	}
}
