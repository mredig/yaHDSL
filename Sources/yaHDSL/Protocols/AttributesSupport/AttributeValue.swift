#if canImport(Foundation)
import Foundation
#endif

public enum AttributeValue: Sendable {
	case string(String)
	case list([String])
	case int(Int)
	case float(Double)
	case bool(Bool)
	case flag

	func renderAttribute(named name: String, options: AttributesOptions) -> String? {
		let renderedValue: String
		switch self {
		case .string(let string):
			renderedValue = Self.sanitizeValueString(string, preferNamedCharacterReferences: options.preferNamedCharacterReferences)
		case .list(let array):
			renderedValue = Self.sanitizeValueString(array.joined(separator: " "), preferNamedCharacterReferences: options.preferNamedCharacterReferences)
		case .int(let int):
			renderedValue = "\(int)"
		case .float(let double):
			renderedValue = "\(double)"
		case .bool(let bool):
			renderedValue = "\(bool)"
		case .flag:
			return "\(name)"
		}

		guard renderedValue.isEmpty == false || options.nullifyEmptyAttributes == false else {
			return nil
		}
		return "\(name)=\"\(renderedValue)\""
	}

	private static func sanitizeValueString(_ string: String, preferNamedCharacterReferences: Bool) -> String {
		#if canImport(Foundation)
		string.reduce(into: "") { outString, character in
			guard
				character.unicodeScalars.allSatisfy({ CharacterMapper.attributeValueAllowedCharacters.contains($0) })
			else {
				if preferNamedCharacterReferences {
					outString += CharacterMapper.preferName(for: character)
				} else {
					outString += CharacterMapper.getCode(for: character)
				}
				return
			}
			outString.append(character)
		}
		#else
		string
		#endif
	}
}

#if canImport(Foundation)
public extension AttributeValue {
	static func b64Data(_ data: any DataProtocol, options: Data.Base64EncodingOptions) -> AttributeValue {
		let string = Data(data).base64EncodedString(options: options)
		return .string(string)
	}
}
#endif
