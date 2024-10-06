public protocol HTMLNode: BasicNode where Output == String, Context == yaHTMLDocument.Context {
	var tag: String? { get }
}
