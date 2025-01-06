public struct AnyHTMLNodes: HTMLNode {
	public var tag: String? { nil }

	public var children: [any HTMLNode]

	public init(children: [any HTMLNode]) {
		self.children = children
	}

	public init(@HTMLContainerNodeBuilder _ builder: () throws -> Self) rethrows {
		self = try builder()
	}

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		try children
			.map { try $0.render(withContext: context) }
			.joined(separator: context.mode == .minify ? "" : "\n")
	}
}

public typealias Group = AnyHTMLNodes
