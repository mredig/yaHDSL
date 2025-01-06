public protocol BodyProtocol: HTMLContentElement, GlobalAttributable, EventAttributable {}
public struct Body: BodyProtocol {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}
