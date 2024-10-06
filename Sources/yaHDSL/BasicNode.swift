public protocol BasicNode: Sendable {
	associatedtype Output
	associatedtype Context
	func render(withContext context: Context) throws -> Output
}
