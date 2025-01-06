public struct yaHTMLDocument: Sendable {
	public struct Context: Sendable {
		public static let `default` = Context(mode: .minify, userInfo: [:])
		public static let `defaultPretty` = Context(mode: .tabIndentation, userInfo: [:])
		public enum Mode: Sendable, Hashable {
			case minify
			case pretty(indentation: String)
			public static let twoSpaceIndentation = Self.pretty(indentation: "  ")
			public static let fourSpaceIndentation = Self.pretty(indentation: "    ")
			public static let tabIndentation = Self.pretty(indentation: "\t")
		}
		public let mode: Mode
		public var depth: Int = 0
		public var userInfo: [String: any Sendable]
		package var nextSibling: (any HTMLNode)?

		public init(mode: Mode, depth: Int = 0, userInfo: [String: any Sendable]) {
			self.mode = mode
			self.depth = depth
			self.userInfo = userInfo
		}
	}

	public let html: any HTMLProtocol
	public let context: Context

	public init(html: any HTMLProtocol, context: Context) {
		self.html = html
		self.context = context
	}

	public func render() throws -> String {
		try """
		<!DOCTYPE html>
		\(html.render(withContext: context))
		"""
	}
}
