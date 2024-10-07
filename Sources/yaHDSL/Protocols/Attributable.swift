public protocol Attributable: Sendable {
	var attributes: [String: AttributeValue] { get set }

	mutating func setAttribute(named name: String, value: AttributeValue)
	mutating func removeAttribute(named name: String)

	func renderAttributes() -> String
}

public extension Attributable {
	mutating func setAttribute(named name: String, value: AttributeValue) {
		attributes[name] = value
	}

	mutating func removeAttribute(named name: String) {
		attributes[name] = nil
	}

	mutating func setAttribute(named name: String, value: String) {
		setAttribute(named: name, value: .string(value))
	}

	mutating func setAttribute(named name: String, values: String...) {
		setAttribute(named: name, value: .list(values))
	}

	mutating func setAttribute(named name: String, value: any BinaryInteger) {
		setAttribute(named: name, value: .int(Int(value)))
	}

	mutating func setAttribute(named name: String, value: any BinaryFloatingPoint) {
		setAttribute(named: name, value: .float(Double(value)))
	}

	mutating func setAttributeFlag(named name: String) {
		attributes[name] = .flag
	}

	func renderAttributes() -> String {
		let accumulator: [String] = attributes.reduce(into: []) { accum, element in
			let name = element.key
			let value = element.value
			accum.append(value.renderAttribute(named: name))
		}
		return accumulator.joined(separator: " ")
	}
}

public enum AttributeValue: Sendable {
	case string(String)
	case list([String])
	case int(Int)
	case float(Double)
	case flag

	func renderAttribute(named name: String) -> String {
		switch self {
		case .string(let string):
			"\(name)=\"\(Self.sanitizeValueString(string))\""
		case .list(let array):
			"\(name)=\"\(Self.sanitizeValueString(array.joined(separator: " ")))\""
		case .int(let int):
			"\(name)=\"\(int)\""
		case .float(let double):
			"\(name)=\"\(double)\""
		case .flag:
			"\(name)"
		}
	}

	private static let attributeValueAllowedCharacters: CharacterSet = {
		var start = CharacterSet.alphanumerics
		start.formUnion(.punctuationCharacters)
		start.formUnion(.symbols)
		start.formUnion(.whitespaces)
		start.remove(charactersIn: "\"'<>&")
		return start
	}()
	private static func sanitizeValueString(_ string: String) -> String {
		string.reduce(into: "") { outString, character in
			guard
				character.unicodeScalars.allSatisfy({ Self.attributeValueAllowedCharacters.contains($0) })
			else {
				outString += CharacterMapper.preferName(for: character)
				return
			}
			outString.append(character)
		}
	}
}

#if canImport(Foundation)
import Foundation

public extension AttributeValue {
	static func b64Data(_ data: any DataProtocol, options: Data.Base64EncodingOptions) -> AttributeValue {
		let string = Data(data).base64EncodedString(options: options)
		return .string(string)
	}
}
#endif

extension Dictionary: Sendable where Key == String, Value == AttributeValue {}
