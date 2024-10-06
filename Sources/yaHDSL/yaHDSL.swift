public protocol BasicNode: Sendable {
	associatedtype Output
	associatedtype Context
	func render(withContext context: Context) throws -> Output
}

public protocol HTMLNode: BasicNode where Output == String, Context == yaHTMLDocument.Context {
	var tag: String? { get }
	var childNodes: [any HTMLNode] { get }

	mutating func addChildNode(_ child: any HTMLNode)
}
