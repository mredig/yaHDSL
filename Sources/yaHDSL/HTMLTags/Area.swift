#if canImport(Foundation)
import Foundation
#endif

public struct Area: HTMLVoidElement, GlobalAttributable, EventAttributable {
	public var tag: String? { "area" }
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	public init() {}
	public init(attributes: [AttributeName: AttributeValue]) {
		self.attributes = attributes
	}
}

public extension Area {
	func withAlt(_ value: String) -> Self {
		setAttribute(named: .alt, value: value)
	}

	func withCoords(_ coordinates: [Int]) -> Self {
		setAttribute(named: .coords, value: coordinates.map(String.init).joined(separator: ","))
	}

	func withDownload(_ filename: String) -> Self {
		setAttribute(named: .download, value: filename)
	}

	func withHref(_ value: String) -> Self {
		setAttribute(named: .href, value: value)
	}

	#if canImport(Foundation)
	func withHref(_ url: URL) -> Self {
		setAttribute(named: .href, value: url.absoluteString)
	}
	#endif

	func withMedia(_ mediaQuery: String) -> Self {
		setAttribute(named: .media, value: mediaQuery)
	}

	typealias ReferrerPolicy = A.ReferrerPolicy
	func withReferrerPolicy(_ policy: ReferrerPolicy) -> Self {
		setAttribute(named: .referrerpolicy, value: policy)
	}

	func withRel(_ relationship: Relationship) -> Self {
		setAttribute(named: .rel, value: relationship)
	}

	struct Shape: RawRepresentable, Sendable, Hashable {
		public var rawValue: String
		public init(rawValue: String) {
			self.rawValue = rawValue
		}

		public static let `default` = Shape(rawValue: "default")
		public static let rect = Shape(rawValue: "rect")
		public static let circle = Shape(rawValue: "circle")
		public static let poly = Shape(rawValue: "poly")
	}
	func withShape(_ shape: Shape) -> Self {
		setAttribute(named: .shape, value: shape)
	}

	typealias Target = A.Target
	func withTarget(_ target: Target) -> Self {
		setAttribute(named: .target, value: target)
	}

	func withType(_ mediaType: String) -> Self {
		setAttribute(named: .type, value: mediaType)
	}
}
