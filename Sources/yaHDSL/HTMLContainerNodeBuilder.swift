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

	public static func buildPartialBlock(accumulated: Component, next: Component) -> Component {
		accumulated + next
	}

	public static func buildPartialBlock(first: Component) -> Component {
		first
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

	public static func buildFinalResult<ResultNode: HTMLContentElement>(_ component: Component) -> ResultNode {
		ResultNode(childNodes: component)
	}

	public static func buildFinalResult(_ component: Component) -> AnyHTMLNodes {
		AnyHTMLNodes(children: component)
	}
}
