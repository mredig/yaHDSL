public protocol HTMLContentElement: HTMLNode, Attributable {
	var childNodes: [any HTMLNode] { get set }

	init(childNodes: [any HTMLNode])

	init(@HTMLContainerNodeBuilder _ builder: () throws -> Self) rethrows
	mutating func addChildNode(_ child: any HTMLNode)
}

extension HTMLContentElement {
	public var tag: String? { String(describing: Self.self).lowercased() }

	public init(@HTMLContainerNodeBuilder _ builder: () throws -> Self) rethrows {
		self = try builder()
	}

	public mutating func addChildNode(_ child: any HTMLNode) {
		childNodes.append(child)
	}

	public func render(withContext context: Context) throws -> Output {
		let childContext = {
			var copy = context
			copy.depth += 1
			copy.nextSibling = nil
			return copy
		}()

		let content: [String] = try {
			var out: [String] = []
			for (index, childNode) in childNodes.enumerated() {
				var childContext = childContext
				let nextIndex = childNodes.index(after: index)
				if childNodes.indices.contains(nextIndex) {
					childContext.nextSibling = childNodes[nextIndex]
				}
				let render = try childNode.render(withContext: childContext)
				guard render.isEmpty == false else { continue }
				out.append(render)
			}
			return out
		}()

		let openingTag = {
			if let tag = tag {
				if let attributeContent = renderAttributes() {
					"<\(tag) \(attributeContent)>"
				} else {
					"<\(tag)>"
				}
			} else {
				""
			}
		}()

		let closingTag = {
			guard let tag = tag else { return "" }
			return "</\(tag)>"
		}()

		switch context.mode {
		case .minify:
			return "\(openingTag)\(content.joined())\(closingTag)"
		case .pretty(indentation: let baseIndentation):
			if tag != nil {
				let indentation = String(repeating: baseIndentation, count: context.depth)
				
				let output: String = {
					var builder: [String] = []
					builder.append("\(indentation)\(openingTag)")
					if content.isEmpty == false {
						builder.append("\(content.joined())")
					}
					builder.append("\(indentation)\(closingTag)")
					return builder.joined(separator: "\n")
				}()
				guard context.nextSibling == nil else {
					return output + "\n"
				}
				return output
			} else {
				return "\(content.joined())\n"
			}
		}
	}
}
