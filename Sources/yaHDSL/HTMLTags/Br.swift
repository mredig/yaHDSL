public struct Br: HTMLSoloNode, GlobalAttributable, EventAttributable {
	public var tag: String? { "br" }

	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
}
