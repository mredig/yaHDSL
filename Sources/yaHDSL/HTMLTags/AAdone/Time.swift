#if canImport(Foundation)
import Foundation
#endif

public struct Time: HTMLContentElement, GlobalAttributable, EventAttributable {
	public var childNodes: [any HTMLNode]
	public var attributes: [AttributeName: AttributeValue] = [:]
	public var attributesOptions: AttributesOptions?

	#if canImport(Foundation)
	public init(timestamp: Date, formatter: DateFormatter? = nil) {
		let dateString = {
			guard let formatter else {
				return ISO8601DateFormatter.internetTime.string(from: timestamp)
			}
			return formatter.string(from: timestamp)
		}()
		self.init(
			userFacingValue: dateString,
			datetimeValue: ISO8601DateFormatter.internetTime.string(from: timestamp))
	}

	public init(timestamp: Date, formatter: ISO8601DateFormatter?) {
		let dateString = (formatter ?? .internetTime).string(from: timestamp)
		self.init(
			userFacingValue: dateString,
			datetimeValue: ISO8601DateFormatter.internetTime.string(from: timestamp))
	}
	#endif

	public init(userFacingValue: String, datetimeValue: String) {
		self = Time { userFacingValue }
			.withDatetime(datetimeValue)
	}

	public init(childNodes: [any HTMLNode] = []) {
		self.childNodes = childNodes
	}
}

public extension Time {
	#if canImport(Foundation)
	func withDatetime(_ timestamp: Date) -> Self {
		withDatetime(ISO8601DateFormatter.internetTime.string(from: timestamp))
	}
	#endif

	func withDatetime(_ value: String) -> Self {
		setAttribute(named: .datetime, value: value)
	}
}
