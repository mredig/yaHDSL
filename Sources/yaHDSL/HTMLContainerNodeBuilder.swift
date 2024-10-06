@resultBuilder
public struct HTMLContainerNodeBuilder {
//	public static func buildBlock<Wrapper: HTMLContainerNode>(_ components: any HTMLNode...) -> Wrapper {
//		buildArray(components)
//	}
//
//	public static func buildPartialBlock<Partial: HTMLContainerNode>(first: Partial) -> Partial {
//		first
//	}
//
//	public static func buildOptional<Component: HTMLNode>(_ component: Component?) -> Either<Component, Empty> {
//		guard let component else {
//			return .b(Empty())
//		}
//		return .a(component)
//	}
//
//	public static func buildEither<FirstNode: HTMLNode>(first component: FirstNode) -> FirstNode {
//		component
//	}
//
//	public static func buildEither<SecondNode: HTMLNode>(second component: SecondNode) -> SecondNode {
//		component
//	}
//
//	public static func buildArray<Wrapper: HTMLContainerNode>(_ components: [any HTMLNode]) -> Wrapper {
//		var new = Wrapper(childNodes: [])
//		for component in components {
//			new.addChildNode(component)
//		}
//		return new
//	}
//
//	public static func buildFinalResult<Wrapper: HTMLContainerNode>(_ component: Wrapper) -> Wrapper {
//		component
//	}
//
//	public static func buildExpression(_ expression: any HTMLNode) -> AnyContainer {
//		AnyContainer(childNodes: [expression])
//	}

//	public static func buildExpression<ExpNode: HTMLNode>(_ expression: ExpNode) -> [ExpNode] {
//		[expression]
//	}



	/*

	public static func buildExpression(_ expression: [any HTMLNode]) -> [any HTMLNode] {
		expression
	}

	public static func buildExpression(_ expression: any HTMLNode) -> [any HTMLNode] {
		[expression]
	}

//
//	public static func buildEither(first component: [any HTMLNode]) -> [any HTMLNode] {
//		component
//	}
//
//	public static func buildEither(second component: [any HTMLNode]) -> [any HTMLNode] {
//		component
//	}

	public static func buildOptional(_ component: [any HTMLNode]?) -> [any HTMLNode] {
		component ?? []
	}

	public static func buildBlock(_ components: any HTMLNode...) -> [any HTMLNode] {
		components
	}

	public static func buildFinalResult<FinalNode: HTMLContainerNode>(_ component: [any HTMLNode]) -> FinalNode {
		FinalNode(childNodes: component)
	}
	 */

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
