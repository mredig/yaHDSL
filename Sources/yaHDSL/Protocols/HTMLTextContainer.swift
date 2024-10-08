public protocol HTMLTextContainer: HTMLNode, GlobalAttributable {
	var text: String { get set }

	init(_ text: String)
}
extension HTMLTextContainer {
	public var tag: String? { String(describing: Self.self).lowercased() }

	public func render(withContext context: Context) throws -> Output {
		guard let tag else { return text }
		let openTag = {
			if let attributeContent = renderAttributes() {
				"<\(tag) \(attributeContent)>"
			} else {
				"<\(tag)>"
			}
		}()
		let closeTag = "</\(tag)>"
		let base = "\(openTag)\(text)\(closeTag)"
		switch context.mode {
		case .minify:
			return base
		case .pretty(indentation: let indentation):
			let totalIndentation = String(repeating: indentation, count: context.depth)
			return "\(totalIndentation)\(base)"
		}
	}
}
