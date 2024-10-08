#if canImport(Foundation)
import Foundation
#endif

public struct Object: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Object {

	func withData(_ url: String) -> Self {
		setAttribute(named: .data, value: url)
	}

	#if canImport(Foundation)
	func withData(_ url: URL) -> Self {
		setAttribute(named: .data, value: url.absoluteString)
	}
	#endif

	func withForm(_ formID: String) -> Self {
		setAttribute(named: .form, value: formID)
	}

	func withHeight(_ height: Int) -> Self {
		setAttribute(named: .height, value: height)
	}

	func withName(_ name: String) -> Self {
		setAttribute(named: .name, value: name)
	}

	func withType(_ mimeType: String) -> Self {
		setAttribute(named: .type, value: mimeType)
	}

	func withWidth(_ width: Int) -> Self {
		setAttribute(named: .width, value: width)
	}
}
