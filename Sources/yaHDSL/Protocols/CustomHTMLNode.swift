public protocol CustomHTMLNode: HTMLNode {
	associatedtype RootNode: HTMLNode

	var node: RootNode { get throws }
}

extension CustomHTMLNode {
	public var tag: String? { try? node.tag }

	public func render(withContext context: Context) throws -> Output {
		try node.render(withContext: context)
	}
}
