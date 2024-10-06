//public struct Text: HTMLNode, ExpressibleByStringLiteral, ExpressibleByStringInterpolation {
//	public var tag: String? { nil }
//
//	public var content: String
//
//	public init(_ content: String) {
//		self.content = content
//	}
//
//	public init(stringLiteral value: String) {
//		self.init(value)
//	}
//
//	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
//		content + " "
//	}
//}

extension String: HTMLNode {
	public var tag: String? { nil }

	public func render(withContext context: yaHTMLDocument.Context) throws -> String {
		guard (context.userInfo["nextNode"] as? String) != nil else {
			return self
		}
		return self + " "
	}
}
