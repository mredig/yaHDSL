extension String: HTMLNode {
	public var tag: String? { nil }

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		guard let nextNode = context.nextSibling else {
			return self
		}
		if nextNode is String {
			return self + " "
		} else {
			return self + "\n"
		}
	}
}
