public struct yaHTMLDocument: Sendable {
	public struct Context: Sendable {
		public static let `default` = Context(mode: .minify, userInfo: [:])
		public static let `defaultPretty` = Context(mode: .tabIndentation, userInfo: [:])
		public enum Mode: Sendable {
			case minify
			case pretty(indentation: String)
			public static let twoSpaceIndentation = Self.pretty(indentation: "  ")
			public static let fourSpaceIndentation = Self.pretty(indentation: "    ")
			public static let tabIndentation = Self.pretty(indentation: "\t")
		}
		public let mode: Mode
		public var depth: Int = 0
		public var userInfo: [String: any Sendable]
	}

	public let html: HTML
	public let context: Context

	public init(html: HTML, context: Context) {
		self.html = html
		self.context = context
	}

	public func render() throws -> String {
		try """
		<DOCTYPE html>
		\(html.render(withContext: context))
		"""
	}
}
