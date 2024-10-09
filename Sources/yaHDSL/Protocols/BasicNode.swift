public protocol BasicNode: Sendable {
	associatedtype Output
	associatedtype Context
	func render(withContext context: Context) throws -> Output
}

public extension BasicNode {
	var yaNS: YetAnotherNamespace<Self> { yaHDSL.YetAnotherNamespace(node: self) }
}

public struct YetAnotherNamespace<T: BasicNode> {
	public let node: T

	public func with(_ block: (_ instance: inout T) throws -> Void) rethrows -> T {
		var new = node
		try block(&new)
		return new
	}
}
