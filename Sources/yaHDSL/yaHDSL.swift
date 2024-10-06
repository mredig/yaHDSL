public protocol BasicNode: Sendable {
	associatedtype Output
	associatedtype Context
	func render(withContext context: Context) throws -> Output
}

public protocol HTMLNode: BasicNode where Output == String, Context == yaHTMLDocument.Context {
	var tag: String? { get }
}

public protocol HTMLContainerNode: HTMLNode {
	var childNodes: [any HTMLNode] { get set }

	mutating func addChildNode(_ child: any HTMLNode)
}

extension HTMLContainerNode {
	public mutating func addChildNode(_ child: any HTMLNode) {
		childNodes.append(child)
	}

	public func render(withContext context: Context) throws -> Output {
		let childContext = {
			var copy = context
			copy.depth += 1
			return copy
		}()
		let content: [String] = try childNodes.compactMap {
			let out = try $0.render(withContext: childContext)
			guard out.isEmpty == false else { return nil }
			return out
		}
		switch context.mode {
		case .minify:
			if let tag {
				return "<\(tag)>\(content.joined())</\(tag)>"
			} else {
				return "\(content.joined())"
			}
		case .pretty(indentation: let indentation):
			let indentedContent = content.map {
				"\(indentation)\($0)"
			}
			if let tag {
				return """
					<\(tag)>
					\(indentedContent.joined(separator: "\n"))
					</\(tag)>
					"""
			} else {
				return "\(indentedContent.joined(separator: "\n"))\n"
			}
		}
	}
}

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
