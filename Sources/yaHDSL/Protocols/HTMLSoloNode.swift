public protocol HTMLSoloNode: HTMLNode {}
extension HTMLSoloNode {
	public func render(withContext context: Context) throws -> Output {
		guard let tag else { return "" }
		switch context.mode {
		case .minify: 
			return "<\(tag)>"
		case .pretty(indentation: let indentation):
			return "\(indentation)<\(tag)>\n"
		}
	}
}
