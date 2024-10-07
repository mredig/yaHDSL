public struct Comment: HTMLNode {
	public var tag: String? { nil }

	public let content: String

	public init(content: String) {
		self.content = content
	}

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		let comment = "<!-- \(content) -->"
		switch context.mode {
		case .minify:
			return comment
		case .pretty(let indentation):
			return "\(String(repeating: indentation, count: context.depth))\(comment)"
		}
	}
}
