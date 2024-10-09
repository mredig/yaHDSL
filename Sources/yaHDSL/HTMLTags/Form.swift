#if canImport(Foundation)
import Foundation
#endif

public struct Form: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	#if canImport(Foundation)
	public init(
		method: Method,
		action: URL,
		encodeType: EncodeType,
		@HTMLContainerNodeBuilder _ builder: () -> Form
	) {
		self.init(method: method, action: action.absoluteString, encodeType: encodeType, builder)
	}
	#endif

	public init(
		method: Method,
		action: String,
		encodeType: EncodeType,
		@HTMLContainerNodeBuilder _ builder: () -> Form
	) {
		self = builder()
			.withMethod(method)
			.withAction(action)
			.withEncType(encodeType)
	}

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Form {
	func withAcceptCharset(_ characterEncodings: [String]) -> Self {
		setAttribute(named: .acceptcharset, value: .list(characterEncodings))
	}

	func withAutoComplete(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .autocomplete)
		} else {
			removeAttribute(named: .autocomplete)
		}
	}

	func withName(_ value: String) -> Self {
		setAttribute(named: .name, value: value)
	}

	func withRel(_ relationship: Relationship) -> Self {
		setAttribute(named: .rel, value: relationship)
	}

	func withAction(_ url: String) -> Self {
		setAttribute(named: .action, value: url)
	}

	#if canImport(Foundation)
	func withAction(_ url: URL) -> Self {
		setAttribute(named: .action, value: url.absoluteString)
	}
	#endif

	struct EncodeType: RawRepresentable, Sendable, Hashable {
		public let rawValue: String

		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let formURLEncoded = EncodeType(rawValue: "application/x-www-form-urlencoded")
		public static let multipartFormData = EncodeType(rawValue: "multipart/form-data")
		public static let plaintext = EncodeType(rawValue: "text/plain")

	}
	func withEncType(_ encodeType: EncodeType) -> Self {
		setAttribute(named: .enctype, value: encodeType)
	}

	struct Method: RawRepresentable, Sendable, Hashable {
		public let rawValue: String

		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let post = Method(rawValue: "post")
		public static let get = Method(rawValue: "get")
		public static let dialog = Method(rawValue: "dialog")
	}
	func withMethod(_ method: Method) -> Self {
		setAttribute(named: .method, value: method)
	}

	func withNoValidate(_ flag: Bool) -> Self {
		if flag {
			setAttributeFlag(named: .novalidate)
		} else {
			removeAttribute(named: .novalidate)
		}
	}

	func withTarget(_ target: A.Target) -> Self {
		setAttribute(named: .target, value: target)
	}
}
