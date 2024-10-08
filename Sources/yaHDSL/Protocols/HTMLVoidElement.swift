public protocol HTMLVoidElement: HTMLNode, GlobalAttributable {
	init()
}
extension HTMLVoidElement {
	public func render(withContext context: Context) throws -> Output {
		guard let tag else { return "" }
		let compiledTag = {
			if let attributeContent = renderAttributes() {
				"<\(tag) \(attributeContent)>"
			} else {
				"<\(tag)>"
			}
		}()
		switch context.mode {
		case .minify:
			return compiledTag
		case .pretty(indentation: let indentation):
			let totalIndentation = String(repeating: indentation, count: context.depth)
			return "\(totalIndentation)\(compiledTag)"
		}
	}
}
