public protocol HTMLContainerNode: HTMLNode {
	var childNodes: [any HTMLNode] { get set }

	mutating func addChildNode(_ child: any HTMLNode)
}

extension HTMLContainerNode {
	public var tag: String? { String(describing: Self.self).lowercased() }
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
		switch context.mode {
		case .minify:
			if let tag {
				return "<\(tag)>\(content.joined())</\(tag)>"
			} else {
				return "\(content.joined())"
			}
		case .pretty(indentation: let baseIndentation):
			if let tag {
				let indentation = String(String(repeating: baseIndentation, count: context.depth))
				
				let output: String = {
					var builder: [String] = []
					builder.append("\(indentation)<\(tag)>")
					if content.isEmpty == false {
						builder.append("\(content.joined())")
					}
					builder.append("\(indentation)</\(tag)>")
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
