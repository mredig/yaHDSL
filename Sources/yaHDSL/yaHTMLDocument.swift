public struct yaHTMLDocument: Sendable {
//	public var childNodes: [any yaHTMLNode]
	public struct Context: Sendable {
		public enum Mode: Sendable {
			case minify
			case pretty(indentation: String)
			public static let twoSpaceIndentation = Self.pretty(indentation: "  ")
			public static let fourSpaceIndentation = Self.pretty(indentation: "    ")
			public static let tabIndentation = Self.pretty(indentation: "\t")
		}
		let mode: Mode
	}

//	public let html: HTML
//	public let context: Context
//
//	public init(html: HTML, context: Context) {
//		self.html = html
//		self.context = context
//	}
//
//	public func render() throws -> String {
//		try """
//		<DOCTYPE html>
//		\(html.render(withContext: context))
//		"""
//	}
}

public struct HTML: HTMLNode {
	public var childNodes: [any HTMLNode]
	public var tag: String? { "html" }
	public mutating func addChildNode(_ child: any HTMLNode) {
		childNodes.append(child)
	}

	public func render(withContext context: Context) throws -> String {
		try childNodes.reduce(into: "") {
			try $0.append($1.render(withContext: context))
		}
	}
}
