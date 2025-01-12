public protocol CustomHTMLNode: HTMLNode {
	associatedtype RootNode: HTMLNode

	var customizations: [@Sendable (RootNode) -> RootNode] { get set }

	var node: RootNode { get throws }
}

extension CustomHTMLNode {
	public var tag: String? { try? node.tag }

	public func render(withContext context: Context) throws -> Output {
		var node = try self.node
		for customization in self.customizations {
			node = customization(node)
		}
		return try node.render(withContext: context)
	}

	public func customize(_ block: @Sendable @escaping (RootNode) -> RootNode) -> Self {
		var new = self
		new.customizations.append(block)
		return new
	}
}
