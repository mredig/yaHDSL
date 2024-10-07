public protocol HTMLSoloNode: HTMLNode, GlobalAttributes {}
extension HTMLSoloNode {
	public func render(withContext context: Context) throws -> Output {
		guard let tag else { return "" }
		let attributeContent = renderAttributes()
		switch context.mode {
		case .minify:
			if attributeContent.isEmpty {
				return "<\(tag)>"
			} else {
				return "<\(tag) \(attributeContent)>"
			}
		case .pretty(indentation: let indentation):
			if attributeContent.isEmpty {
				return "\(indentation)<\(tag)>\n"
			} else {
				return "\(indentation)<\(tag) \(attributeContent)>\n"
			}
		}
	}
}
