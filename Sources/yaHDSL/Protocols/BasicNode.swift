public protocol BasicNode: Sendable {
	associatedtype Output
	associatedtype Context
	func render(withContext context: Context) throws -> Output
}

public extension BasicNode {
	func with(_ block: (_ instance: inout Self) throws -> Void) rethrows -> Self {
		var new = self
		try block(&new)
		return new
	}
}
