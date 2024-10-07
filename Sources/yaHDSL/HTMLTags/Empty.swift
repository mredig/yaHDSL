public struct Empty: HTMLVoidElement {
	public var tag: String? { nil }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init () {}

	public func setAttribute(named name: AttributeName, value: AttributeValue) -> Empty { self }
}
