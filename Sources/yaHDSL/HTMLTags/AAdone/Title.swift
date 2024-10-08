public struct Title: HTMLNode, GlobalAttributable, EventAttributable {

	public var tag: String? { "title" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public var text: String

	public init(_ text: String) {
		self.text = text
	}

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		let openTag = {
			if let attributeContent = renderAttributes() {
				"<title \(attributeContent)>"
			} else {
				"<title>"
			}
		}()
		let base = "\(openTag)\(text)</title>"
		switch context.mode {
		case .minify:
			return base
		case .pretty(let baseIndentation):
			let indentation = String(repeating: baseIndentation, count: context.depth)
			return "\(indentation)\(base)"
		}
	}
}
