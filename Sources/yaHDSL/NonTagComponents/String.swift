extension String: HTMLNode {
	public var tag: String? { nil }

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		guard let nextNode = context.nextSibling else {
			return self
		}
		if let nextNode = nextNode as? String, self.last != " ", nextNode.first != " " {
			return self + " "
		} else {
			if context.mode == .minify {
				return self
			} else {
				return self + "\n"
			}
		}
	}
}
