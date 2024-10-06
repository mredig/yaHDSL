@resultBuilder
public struct HTMLContainerNodeBuilder {
	public typealias Expression = any HTMLNode
	public typealias Component = [any HTMLNode]

	public static func buildExpression(_ expression: Expression) -> Component {
		[expression]
	}

	public static func buildBlock(_ components: Component...) -> Component {
		buildArray(components)
	}

	public static func buildOptional(_ component: Component?) -> Component {
		component ?? []
	}

	public static func buildEither(first component: Component) -> Component {
		component
	}

	public static func buildEither(second component: Component) -> Component {
		component
	}

	public static func buildArray(_ components: [Component]) -> Component {
		components.flatMap { $0 }
	}

	public static func buildFinalResult<ResultNode: HTMLContainerNode>(_ component: Component) -> ResultNode {
		ResultNode(childNodes: component)
	}
}
